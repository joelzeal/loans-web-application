<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="LoanWebApplication4.admin.Branches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 117px;
        }
        .style2
        {
            width: 220px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Investment Durations</h2><br />
<div class="DataSection">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="BranchID" 
        DataSourceID="BranchesSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            LoanDurationId:
            <asp:Label ID="LoanDurationIdLabel1" runat="server" 
                Text='<%# Eval("LoanDurationId") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            NumberOfMonths:
            <asp:TextBox ID="NumberOfMonthsTextBox" runat="server" 
                Text='<%# Bind("NumberOfMonths") %>' />
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
                    <td class="style1">
                        Branch Name:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("BranchName") %>' Width="200px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DescriptionTextBox" ErrorMessage="Banch name is required" 
                            ForeColor="Red" ValidationGroup="g4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Branch Code:</td>
                    <td class="style2">
                        <asp:TextBox ID="NumberOfMonthsTextBox" runat="server" 
                            Text='<%# Bind("BranchCode") %>' Width="200px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="NumberOfMonthsTextBox" 
                            ErrorMessage="Branch code is required" ForeColor="Red" 
                            ValidationGroup="g4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" ValidationGroup="g4" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            LoanDurationId:
            <asp:Label ID="LoanDurationIdLabel" runat="server" 
                Text='<%# Eval("LoanDurationId") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            NumberOfMonths:
            <asp:Label ID="NumberOfMonthsLabel" runat="server" 
                Text='<%# Bind("NumberOfMonths") %>' />
            <br />
            CreatedBy:
            <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
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
    </asp:FormView>
    <asp:SqlDataSource ID="BranchesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [Branches] WHERE [BranchID] = @BranchID" 
        InsertCommand="INSERT INTO [Branches] ([BranchName], [BranchCode]) VALUES (@BranchName, @BranchCode)" 
        SelectCommand="SELECT * FROM [Branches] ORDER BY [BranchName]" 
        
        UpdateCommand="UPDATE [Branches] SET [BranchName] = @BranchName, [BranchCode] = @BranchCode WHERE [BranchID] = @BranchID">
        <DeleteParameters>
            <asp:Parameter Name="BranchID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BranchName" Type="String" />
            <asp:Parameter Name="BranchCode" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BranchName" Type="String" />
            <asp:Parameter Name="BranchCode" Type="String" />
            <asp:Parameter Name="BranchID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BranchId" 
    DataSourceID="BranchesSqlDataSource" EmptyDataText="No data available." 
    ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True">
            <HeaderStyle Width="20px" />
            </asp:CommandField>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
            <asp:BoundField DataField="BranchName" HeaderText="Branch Name" 
                InsertVisible="False" ReadOnly="True" SortExpression="BranchName" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="BranchCode" HeaderText="Branch Code" 
                SortExpression="BranchCode">
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
</asp:Content>
