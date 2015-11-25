<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="InvestmentTypesSetup.aspx.cs" Inherits="LoanWebApplication4.admin.InvestmentTypesSetup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 220px;
        }
    .style3
    {
        width: 131px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Investment Descriptions Setup</h2><br />
<div class="DataSection">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LoanDurationId" 
        DataSourceID="SqlDataSource1" DefaultMode="Insert" 
        Width="690px">
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
                    <td class="style3">
                        Investment Type:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Descriprion") %>' Width="300px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DescriptionTextBox" ErrorMessage="Investment Type is required" 
                            ForeColor="Red" ValidationGroup="g4"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
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
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [InvestmentDecriptions] WHERE [InvestmentDecriptionId] = @InvestmentDecriptionId" 
        InsertCommand="INSERT INTO [InvestmentDecriptions] ([Descriprion], [CreatedDate]) VALUES (@Descriprion, @CreatedDate)" 
        SelectCommand="SELECT * FROM [InvestmentDecriptions] ORDER BY [Descriprion]" 
        UpdateCommand="UPDATE [InvestmentDecriptions] SET [Descriprion] = @Descriprion, [CreatedDate] = @CreatedDate WHERE [InvestmentDecriptionId] = @InvestmentDecriptionId">
        <DeleteParameters>
            <asp:Parameter Name="InvestmentDecriptionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Descriprion" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descriprion" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="InvestmentDecriptionId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="InvestmentDecriptionId" 
    DataSourceID="SqlDataSource1" EmptyDataText="No data available." 
    ForeColor="#333333" GridLines="None" Width="100%">
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
            <asp:BoundField DataField="Descriprion" HeaderText="Investment Description" 
                SortExpression="Descriprion" >
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
