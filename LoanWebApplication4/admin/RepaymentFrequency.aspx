<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="RepaymentFrequency.aspx.cs" Inherits="LoanWebApplication4.admin.LoanRepaymentFrequency" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 113px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    Loan Repayment Frenquency
</h2>
<br />

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RepaymentFrequencyId" 
        DataSourceID="RepaymentFrequenciesSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            RepaymentFrequencyId:
            <asp:Label ID="RepaymentFrequencyIdLabel1" runat="server" 
                Text='<%# Eval("RepaymentFrequencyId") %>' />
            <br />
            NumberOfDays:
            <asp:TextBox ID="NumberOfDaysTextBox" runat="server" 
                Text='<%# Bind("NumberOfDays") %>' />
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
                    <td class="style2">
                        Number Of Days:
                    </td>
                    <td>
                        <asp:TextBox ID="NumberOfDaysTextBox" runat="server" 
                            Text='<%# Bind("NumberOfDays") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Description:
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" onclick="InsertButton_Click" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            RepaymentFrequencyId:
            <asp:Label ID="RepaymentFrequencyIdLabel" runat="server" 
                Text='<%# Eval("RepaymentFrequencyId") %>' />
            <br />
            NumberOfDays:
            <asp:Label ID="NumberOfDaysLabel" runat="server" 
                Text='<%# Bind("NumberOfDays") %>' />
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
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="RepaymentFrequencyId" 
    DataSourceID="RepaymentFrequenciesSqlDataSource" ForeColor="#333333" 
    GridLines="None" Width="97%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RepaymentFrequencyId" 
                HeaderText="RepaymentFrequencyId" InsertVisible="False" ReadOnly="True" 
                SortExpression="RepaymentFrequencyId" Visible="False" />
            <asp:BoundField DataField="NumberOfDays" HeaderText="Number Of Days" 
                SortExpression="NumberOfDays">
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
    
        UpdateCommand="UPDATE [RepaymentFrequencies] SET [NumberOfDays] = @NumberOfDays, [Description] = @Description WHERE [RepaymentFrequencyId] = @RepaymentFrequencyId" 
        ondeleting="item_Deleting" oninserting="item_inserting" 
        onupdating="item_Updating">
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
