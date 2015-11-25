<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="AccountTypeFeatures.aspx.cs" Inherits="LoanWebApplication4.admin.AccountTypeFeatures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
    <tr>
        <td><h1>Account Type Features - <asp:Label ID="Label1" runat="server" ></asp:Label></h1></td><td align="right">
            <asp:ImageButton ID="ImageButton2" runat="server" Width="32px"
                ImageUrl="~/images/Bank_account.png" onclick="ImageButton2_Click" 
                ToolTip="Back To Account Type" />
&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Width="32px"
                ImageUrl="~/images/newFeature.png" ToolTip="New Feature" 
                onclick="ImageButton1_Click" />
        </td>
    </tr>
</table>
    
    <hr />
    <br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AccountFeatureID" 
        DataSourceID="AccountTypeFeaturesSqlDataSource" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
         <asp:TemplateField HeaderText="No." HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="AccountFeatureID,AccountTypeID" 
                DataNavigateUrlFormatString="~/admin/AccountTypeFeatureEdit.aspx?fid={0}&amp;accType={1}" 
                NavigateUrl="~/admin/AccountTypeFeatureEdit.aspx" Text="Details" />
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
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
            <asp:QueryStringParameter Name="AccountTypeID" QueryStringField="accType" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
