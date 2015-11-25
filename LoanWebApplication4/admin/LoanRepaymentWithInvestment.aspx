<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanRepaymentWithInvestment.aspx.cs" Inherits="LoanWebApplication4.LoanRepaymentWithInvestment" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../UserControls/LoansToolBarWebUserControl.ascx" tagname="LoansToolBarWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Select Investment</h3>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <asp:Panel CssClass="errorDiv" ID="errorPanel" runat="server" Visible="false">
          <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
    </asp:Panel>
  
    <table style="width: 100%;">
        <tr>
            <td class="style1" valign="middle">
                Repayment Amount:</td>
            <td valign="middle">
                <asp:TextBox ID="txtRepaymentAmount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtRepaymentAmount" ErrorMessage="Repayment is required" 
                    ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </td>
            <td valign="middle">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Investment:</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="InvestmentsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    
                    SelectCommand="SELECT InvestmentID, MemberID, InvestmentAmount, ISNULL(dbo.GetTotalInvestmentContribution(InvestmentID), 0) - ISNULL(dbo.GetTotalInvestmentWithdrawal(InvestmentID), 0) AS Balance, ISNULL(dbo.GetTotalInvestmentContribution(InvestmentID), 0) AS TotalDeposit, ISNULL(dbo.GetTotalInvestmentWithdrawal(InvestmentID), 0) AS TotalWithdrawal FROM Investments WHERE (MemberID = @MemberID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="InvestmentHiddenField" runat="server" />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#993300" Text="No investment found for the current member"></asp:Label>
                <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtInvestment" runat="server" ReadOnly="true" Width="200px" />
                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtInvestment" ErrorMessage="Investment is required" 
                                        ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                   
                                    <asp:Panel ID="FriendDropDown" runat="server" ScrollBars="None"
                                        Style="max-height: 150px; overflow: auto; border:1px solid red">
                                        <asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" DataKeyNames="InvestmentID" ForeColor="#333333" 
                                            GridLines="None" OnRowDataBound="FriendGridView_RowDataBound" 
                                            OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged" 
                                            DataSourceID="InvestmentsSqlDataSource" 
                                            ondatabound="FriendGridView_DataBound">
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField DataField="InvestmentID" HeaderText="InvestmentID" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="InvestmentID" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                                                    SortExpression="MemberID" Visible="False" />
                                                <asp:TemplateField HeaderText="Invest. Amount" 
                                                    SortExpression="InvestmentAmount">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" 
                                                            Text='<%# Bind("InvestmentAmount") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("InvestmentAmount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Balance" SortExpression="Balance">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="TotalDeposit" HeaderText="Total Deposit" 
                                                    ReadOnly="True" SortExpression="TotalDeposit" />
                                                <asp:BoundField DataField="TotalWithdrawal" HeaderText="Total Withdrawal" 
                                                    ReadOnly="True" SortExpression="TotalWithdrawal" />
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                   <%--<asp:DropDownExtender ID="DropDownExtender12" runat="server" 
                                        DropDownControlID="FriendDropDown" TargetControlID="txtFriend" />--%>
                                         <asp:DropDownExtender ID="txtInvestment_DropDownExtender" runat="server" 
                                        TargetControlID="txtInvestment" DropDownControlID="FriendDropDown">
                                    </asp:DropDownExtender>
                                    <%-- <asp:DropDownExtender ID="DropDownExtender2" runat="server">
                                    </asp:DropDownExtender>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="FriendGridView" />
                                </Triggers>
                            </asp:UpdatePanel></td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                    ValidationGroup="g1">Continue</asp:LinkButton>
            &nbsp;
                <asp:LinkButton ID="CancelLinkButton" runat="server" 
                    onclick="CancelLinkButton_Click">Cancel</asp:LinkButton>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
