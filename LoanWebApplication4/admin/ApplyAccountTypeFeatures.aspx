<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="ApplyAccountTypeFeatures.aspx.cs" Inherits="LoanWebApplication4.admin.ApplyAccountTypeFeatures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 256px;
        }
        .style3
        {
            width: 114px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Apply Account Type Features</h1>
    <table style="width:100%;">
        <tr>
            <td class="style3" valign="top">
                Account Type:</td>
            <td class="style2" valign="top">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="250px" 
                    AutoPostBack="True" DataSourceID="AccountTypesSqlDataSource" 
                    DataTextField="Description" DataValueField="AccountTypeId" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    ondatabound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AccountTypesSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [AccountTypes] ORDER BY [Description]">
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="DropDownList1" ErrorMessage="*" Operator="NotEqual" 
                                SetFocusOnError="True" style="color: #CC3300" 
                                ValueToCompare="-----Select Account Type------"></asp:CompareValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkOnlyMembersOlderThanAMonth" runat="server" Checked="True" 
                                Text="Select only members that have been added a month and more ago" 
                                AutoPostBack="True" 
                                oncheckedchanged="chkOnlyMembersOlderThanAMonth_CheckedChanged" />
                            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
                <h3>
                    Account Type Features</h3>
                    <hr />
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="3">
    <asp:GridView ID="GridView2" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AccountFeatureID" 
        DataSourceID="AccountTypeFeaturesSqlDataSource" ForeColor="#333333" 
        GridLines="None" ondatabound="GridView2_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
         <asp:TemplateField HeaderText="No." HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsDeduction" HeaderText="Is Deduction" 
                SortExpression="IsDeduction">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="IsPercentage" HeaderText="Is Percentage" 
                SortExpression="IsPercentage">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="ValueToApply" HeaderText="Value To Apply" 
                SortExpression="ValueToApply">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="CalculateOn1" HeaderText="Calculate On" 
                SortExpression="CalculateOn1">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FeatureCalculationFreq" 
                HeaderText="Feature Calculation Freq" SortExpression="FeatureCalculationFreq">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
           <center> <asp:Label ID="Label2" runat="server" style="text-align: center" Text="No account features have been added for the selected account type."></asp:Label></center>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="green" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="AccountTypeFeaturesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT AccountTypeFeatures.AccountFeatureID, AccountTypeFeatures.AccountTypeID, AccountTypeFeatures.IsDeduction, AccountTypeFeatures.IsPercentage, AccountTypeFeatures.CalculateOn, AccountTypeFeatures.ValueToApply, AccountTypeFeatures.CalculationFrequencyID, AccountTypeFeatures.MonthlyCalculationDay, AccountTypeFeatures.AnnualCalculationMonth, AccountTypeFeatures.AnnualCalculationDay, AccountTypeFeatures.HasCustomCalculationFrequency, AccountTypeFeatures.CustomCalculationFreqNumberOfDays, AccountTypeFeaturesCalculateOn.Description AS CalculateOn, AccountFeatureFreqOfCalculation.Description AS FeatureCalculationFreq FROM AccountTypeFeatures INNER JOIN AccountTypeFeaturesCalculateOn ON AccountTypeFeatures.CalculateOn = AccountTypeFeaturesCalculateOn.AccountTypeFeaturesCalculateOnID INNER JOIN AccountFeatureFreqOfCalculation ON AccountTypeFeatures.CalculationFrequencyID = AccountFeatureFreqOfCalculation.AccountFeatureFreqOfCalculationID WHERE (AccountTypeFeatures.AccountTypeID = @AccountTypeID)" 
        DeleteCommand="DELETE FROM AccountTypeFeatures WHERE (AccountFeatureID = @AccountFeatureID)">
        <DeleteParameters>
            <asp:Parameter Name="AccountFeatureID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="AccountTypeID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td align="right">
                <asp:Button ID="Button1" runat="server" Text="Apply Features" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                
            </td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <h3>Account Holders</h3>
        <hr />
           <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                ValidationGroup="vg1234">Check All</asp:LinkButton>
            &nbsp;&nbsp;
           <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                ValidationGroup="vg1234">Uncheck All</asp:LinkButton>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width="100%" AutoGenerateColumns="False" 
                DataKeyNames="InvestmentID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField SortExpression="MemberId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MemberId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Text=" " />
                        </ItemTemplate>
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="InvestmentID" HeaderText="InvestmentID" 
                        SortExpression="InvestmentID" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" 
                        SortExpression="AccountNumber">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                        SortExpression="MemberId" Visible="False" />
                    <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" 
                        SortExpression="AccountTypeID" Visible="False" />
                   <%-- <asp:BoundField DataField="TotalInterestApplied" 
                        HeaderText="Total Interest Applied" SortExpression="TotalInterestApplied">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>--%>
                    <asp:TemplateField HeaderText="Balance" SortExpression="Balance">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Balance") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                            <asp:HiddenField ID="HiddenField1" runat="server" 
                                Value='<%# Eval("InvestmentID") %>' />
                        </ItemTemplate>
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
            <asp:SqlDataSource ID="vwMembersWithInvestmentsSqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                
                SelectCommand="SELECT * FROM [vwMembersWithInvestments] WHERE ([AccountTypeID] = @AccountTypeID) ORDER BY [Name]" 
                onselecting="vwMembersWithInvestmentsSqlDataSource_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="AccountTypeID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
