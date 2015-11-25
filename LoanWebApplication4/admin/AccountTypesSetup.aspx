<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="AccountTypesSetup.aspx.cs" Inherits="LoanWebApplication4.admin.AccountTypesSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 303px;
        }
        .style4
        {
            width: 152px;
        }
        .style5
        {
            width: 44px;
        }
        .style8
        {
            width: 199px;
        }
        .style9
        {
            width: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        AccounT Types</h2>
    <br />
    <div class="DataSection">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountTypeId" DataSourceID="AccountTypesSqlDataSource"
            DefaultMode="Insert" Width="780px">
            <EditItemTemplate>
                AccountTypeId:
                <asp:Label ID="AccountTypeIdLabel1" runat="server" Text='<%# Eval("AccountTypeId") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                MinimumBalance:
                <asp:TextBox ID="MinimumBalanceTextBox" runat="server" Text='<%# Bind("MinimumBalance") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td class="style9">
                            <strong>Account Type:</strong>
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                Width="300px" />
                        </td>
                        <td class="style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DescriptionTextBox"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="gg1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style8">
                            <strong>Default Investment Type:</strong></td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="InvestmentTypeSqlDataSource" DataTextField="Description" 
                                DataValueField="InvestmentTypeId" 
                                SelectedValue='<%# Bind("DefaultInvestmentTypeID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="InvestmentTypeSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [InvestmentTypes] ORDER BY [InvestmentTypeId]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            <strong>Minimum Balance:</strong>
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="MinimumBalanceTextBox" runat="server" Text='<%# Bind("MinimumBalance") %>'
                                Width="300px" />
                        </td>
                        <td class="style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MinimumBalanceTextBox"
                                ErrorMessage="*" ForeColor="Red" ValidationGroup="gg1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style8">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style1">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Save" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td class="style5">
                            &nbsp;
                        </td>
                        <td class="style8">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                AccountTypeId:
                <asp:Label ID="AccountTypeIdLabel" runat="server" Text='<%# Eval("AccountTypeId") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                MinimumBalance:
                <asp:Label ID="MinimumBalanceLabel" runat="server" Text='<%# Bind("MinimumBalance") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="AccountTypesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM [AccountTypes] WHERE [AccountTypeId] = @AccountTypeId"
            InsertCommand="INSERT INTO AccountTypes(Description, MinimumBalance, DefaultInvestmentTypeID) VALUES (@Description, @MinimumBalance, @DefaultInvestmentTypeID)"
            SelectCommand="SELECT AccountTypes.AccountTypeId, AccountTypes.Description, AccountTypes.MinimumBalance, AccountTypes.DefaultInvestmentTypeID, InvestmentTypes.Description AS DefaultInvestmentTypeDescription FROM AccountTypes LEFT OUTER JOIN InvestmentTypes ON AccountTypes.DefaultInvestmentTypeID = InvestmentTypes.InvestmentTypeId" 
            UpdateCommand="UPDATE AccountTypes SET Description = @Description, MinimumBalance = @MinimumBalance, DefaultInvestmentTypeID = @DefaultInvestmentTypeID WHERE (AccountTypeId = @AccountTypeId)" 
            ondeleting="item_Deleting" oninserting="item_insering" 
            onupdating="item_Updating">
            <DeleteParameters>
                <asp:Parameter Name="AccountTypeId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="MinimumBalance" Type="Decimal" />
                <asp:Parameter Name="DefaultInvestmentTypeID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="MinimumBalance" Type="Decimal" />
                <asp:Parameter Name="AccountTypeId" Type="Int32" />
                <asp:Parameter Name="DefaultInvestmentTypeID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="AccountTypeId" DataSourceID="AccountTypesSqlDataSource"
        EmptyDataText="No data available." ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True">
                <HeaderStyle Width="50px" />
            </asp:CommandField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="AccountTypeId" 
                DataNavigateUrlFormatString="~/admin/AccountTypeFeatures.aspx?accType={0}" 
                NavigateUrl="~/admin/AccountTypeFeatures.aspx" Text="Features">
            <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="AccountTypeId" HeaderText="AccountTypeId" InsertVisible="False"
                ReadOnly="True" SortExpression="AccountTypeId" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Account Type" SortExpression="Description">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MinimumBalance" HeaderText="Minimum Balance" SortExpression="MinimumBalance">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Default Investment Type" 
                SortExpression="DefaultInvestmentTypeID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("DefaultInvestmentTypeDescription") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="InvetmentTypesSqlDataSource1" DataTextField="Description" 
                        DataValueField="InvestmentTypeId" 
                        SelectedValue='<%# Bind("DefaultInvestmentTypeID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="InvetmentTypesSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                        SelectCommand="SELECT * FROM [InvestmentTypes] ORDER BY [InvestmentTypeId]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
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
