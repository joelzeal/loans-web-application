<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanSsttings.aspx.cs" Inherits="LoanWebApplication4.admin.LoanSsttings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
    {
        width: 126px;
    }
    .style4
    {
        width: 179px;
    }
        .style6
        {
            width: 220px;
        }
        .style7
        {
            font-size: x-small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Loan Penalty Settings</h2>
<br />
<div class="DataSection">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyId" 
        DataSourceID="CompanyProfileSqlDataSource" DefaultMode="Edit" 
    Width="735px" oniteminserted="FormView1_ItemInserted" 
    onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            <table style="width: 92%;">
                <%--<tr>
                    <td class="style2">
                        Default Interest Rate Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            SelectedValue='<%# Bind("DefaultInterestRateTypeId") %>'>
                            <asp:ListItem Value="1">Compound Interest</asp:ListItem>
                            <asp:ListItem Value="2">Simple Interest</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Compound Interest Rate (%):
                    </td>
                    <td>
                        <asp:TextBox ID="CompoundInterestRateTextBox" runat="server" 
                            style="text-align: right" Text='<%# Bind("CompoundInterestRate") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Compound Frequency:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            SelectedValue='<%# Bind("CompoundFrequency") %>'>
                            <asp:ListItem Value="1">Annually</asp:ListItem>
                            <asp:ListItem Value="2">Semi Annually</asp:ListItem>
                            <asp:ListItem Value="4">Quarterly</asp:ListItem>
                            <asp:ListItem Value="12">Monthly</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>--%>
                <tr>
                    <td class="style6">
                        Defaulters Interest (%):</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" style="text-align: right" 
                            Text='<%# Bind("DefaultersInteresty") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        Grace Periods <span class="style7">(in days)</span>:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GracePeriodDays") %>' 
                            style="text-align: right"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        Penalty Calculation Frequency<br /> <span class="style7">(in days):</span></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("PenaltyCalculationFrequencyDays") %>' 
                            style="text-align: right"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Save" />
                        &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            CompanyName:
            <asp:TextBox ID="CompanyNameTextBox" runat="server" 
                Text='<%# Bind("CompanyName") %>' />
            <br />

            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            website:
            <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' />
            <br />
            EndOfDayLastRunDate:
            <asp:TextBox ID="EndOfDayLastRunDateTextBox" runat="server" 
                Text='<%# Bind("EndOfDayLastRunDate") %>' />
            <br />
            DefaultInterestRateTypeId:
            <asp:TextBox ID="DefaultInterestRateTypeIdTextBox" runat="server" 
                Text='<%# Bind("DefaultInterestRateTypeId") %>' />
            <br />
            CompoundInterestRate:
            <asp:TextBox ID="CompoundInterestRateTextBox" runat="server" 
                Text='<%# Bind("CompoundInterestRate") %>' />
            <br />
            SimpleInterestRate:
            <asp:TextBox ID="SimpleInterestRateTextBox" runat="server" 
                Text='<%# Bind("SimpleInterestRate") %>' />
            <br />
            CompoundFrequency:
            <asp:TextBox ID="CompoundFrequencyTextBox" runat="server" 
                Text='<%# Bind("CompoundFrequency") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CompanyName:
            <asp:Label ID="CompanyNameLabel" runat="server" 
                Text='<%# Bind("CompanyName") %>' />
            <br />
            CompanyId:
            <asp:Label ID="CompanyIdLabel" runat="server" Text='<%# Eval("CompanyId") %>' />
            <br />
            address:
            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            website:
            <asp:Label ID="websiteLabel" runat="server" Text='<%# Bind("website") %>' />
            <br />
            EndOfDayLastRunDate:
            <asp:Label ID="EndOfDayLastRunDateLabel" runat="server" 
                Text='<%# Bind("EndOfDayLastRunDate") %>' />
            <br />
            DefaultInterestRateTypeId:
            <asp:Label ID="DefaultInterestRateTypeIdLabel" runat="server" 
                Text='<%# Bind("DefaultInterestRateTypeId") %>' />
            <br />
            CompoundInterestRate:
            <asp:Label ID="CompoundInterestRateLabel" runat="server" 
                Text='<%# Bind("CompoundInterestRate") %>' />
            <br />
            SimpleInterestRate:
            <asp:Label ID="SimpleInterestRateLabel" runat="server" 
                Text='<%# Bind("SimpleInterestRate") %>' />
            <br />
            CompoundFrequency:
            <asp:Label ID="CompoundFrequencyLabel" runat="server" 
                Text='<%# Bind("CompoundFrequency") %>' />
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
    <div style="border-bottom:1px dotted gray">
        <br />
</div>
    <asp:SqlDataSource ID="CompanyProfileSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [CompanyProfile] WHERE [CompanyId] = @CompanyId" 
        InsertCommand="INSERT INTO [CompanyProfile] ([CompanyName], [address], [Email], [website], [EndOfDayLastRunDate], [DefaultInterestRateTypeId], [CompoundInterestRate], [SimpleInterestRate], [CompoundFrequency]) VALUES (@CompanyName, @address, @Email, @website, @EndOfDayLastRunDate, @DefaultInterestRateTypeId, @CompoundInterestRate, @SimpleInterestRate, @CompoundFrequency)" 
        SelectCommand="SELECT * FROM [CompanyProfile]" 
        
    
        UpdateCommand="UPDATE CompanyProfile SET CompanyName = @CompanyName, address = @address, Email = @Email, website = @website, EndOfDayLastRunDate = @EndOfDayLastRunDate, DefaultInterestRateTypeId = @DefaultInterestRateTypeId, CompoundInterestRate = @CompoundInterestRate, SimpleInterestRate = @SimpleInterestRate, CompoundFrequency = @CompoundFrequency, DefaultersInterest = @DefaultersInterest WHERE (CompanyId = @CompanyId)" 
        ondeleting="item_Deleting" oninserting="item_inserting" 
        onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="CompanyId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="EndOfDayLastRunDate" Type="DateTime" />
            <asp:Parameter Name="DefaultInterestRateTypeId" Type="Int32" />
            <asp:Parameter Name="CompoundInterestRate" Type="Decimal" />
            <asp:Parameter Name="SimpleInterestRate" Type="Decimal" />
            <asp:Parameter Name="CompoundFrequency" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="EndOfDayLastRunDate" Type="DateTime" />
            <asp:Parameter Name="DefaultInterestRateTypeId" Type="Int32" />
            <asp:Parameter Name="CompoundInterestRate" Type="Decimal" />
            <asp:Parameter Name="SimpleInterestRate" Type="Decimal" />
            <asp:Parameter Name="CompoundFrequency" Type="Int32" />
            <asp:Parameter Name="CompanyId" Type="Int32" />
            <asp:Parameter Name="DefaultersInterest" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <h2>Interest Presets</h2><br />
    <div class="DataSection">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="LoanPresetId" 
            DataSourceID="LoanPresetsSqlDataSource" DefaultMode="Insert" Width="100%">
            <EditItemTemplate>
                LoanPresetId:
                <asp:Label ID="LoanPresetIdLabel1" runat="server" 
                    Text='<%# Eval("LoanPresetId") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                NumberOfMonths:
                <asp:TextBox ID="NumberOfMonthsTextBox" runat="server" 
                    Text='<%# Bind("NumberOfMonths") %>' />
                <br />
                InsterestRate:
                <asp:TextBox ID="InsterestRateTextBox" runat="server" 
                    Text='<%# Bind("InsterestRate") %>' />
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
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td class="style3">
                            Description:</td>
                        <td class="style4">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                Text='<%# Bind("Description") %>' Width="200px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DescriptionTextBox" ErrorMessage="Description is required" 
                                ForeColor="Red" ValidationGroup="g3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Number of Months:
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="NumberOfMonthsTextBox" runat="server" 
                                Text='<%# Bind("NumberOfMonths") %>' Width="200px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="NumberOfMonthsTextBox" 
                                ErrorMessage="Number of month(s) is required" ForeColor="Red" 
                                ValidationGroup="g3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Insterest Rate:
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="InsterestRateTextBox" runat="server" 
                                Text='<%# Bind("InsterestRate") %>' Width="200px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="InsterestRateTextBox" 
                                ErrorMessage="Interest rate is required" ForeColor="Red" ValidationGroup="g3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style4">
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
                LoanPresetId:
                <asp:Label ID="LoanPresetIdLabel" runat="server" 
                    Text='<%# Eval("LoanPresetId") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                NumberOfMonths:
                <asp:Label ID="NumberOfMonthsLabel" runat="server" 
                    Text='<%# Bind("NumberOfMonths") %>' />
                <br />
                InsterestRate:
                <asp:Label ID="InsterestRateLabel" runat="server" 
                    Text='<%# Bind("InsterestRate") %>' />
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
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LoanPresetId" 
        DataSourceID="LoanPresetsSqlDataSource" ForeColor="#333333" GridLines="None" 
        Width="100%" EmptyDataText="No interest preset data">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
            <HeaderStyle Width="100px" />
            </asp:CommandField>
            <asp:BoundField DataField="LoanPresetId" HeaderText="LoanPresetId" 
                InsertVisible="False" ReadOnly="True" SortExpression="LoanPresetId" 
                Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="NumberOfMonths" HeaderText="Number of Months" 
                SortExpression="NumberOfMonths">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="InsterestRate" HeaderText="Insterest Rate" 
                SortExpression="InsterestRate">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                SortExpression="CreatedBy" Visible="False" />
            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" 
                SortExpression="CreatedDate" Visible="False" />
            <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" 
                SortExpression="ModifiedBy" Visible="False" />
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
    <asp:SqlDataSource ID="LoanPresetsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [LoanPresets] WHERE [LoanPresetId] = @LoanPresetId" 
        InsertCommand="INSERT INTO [LoanPresets] ([Description], [NumberOfMonths], [InsterestRate], [CreatedBy], [CreatedDate], [ModifiedBy]) VALUES (@Description, @NumberOfMonths, @InsterestRate, @CreatedBy, @CreatedDate, @ModifiedBy)" 
        SelectCommand="SELECT * FROM [LoanPresets]" 
        
        UpdateCommand="UPDATE [LoanPresets] SET [Description] = @Description, [NumberOfMonths] = @NumberOfMonths, [InsterestRate] = @InsterestRate, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy WHERE [LoanPresetId] = @LoanPresetId" 
        ondeleting="item_Deleting" oninserting="item_inserting" 
        onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="LoanPresetId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="NumberOfMonths" Type="Decimal" />
            <asp:Parameter Name="InsterestRate" Type="Decimal" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="NumberOfMonths" Type="Decimal" />
            <asp:Parameter Name="InsterestRate" Type="Decimal" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="LoanPresetId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
