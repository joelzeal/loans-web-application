<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanRepaymentWithInvestment.aspx.cs" Inherits="LoanWebApplication4.LoanRepaymentWithInvestment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../UserControls/LoansToolBarWebUserControl.ascx" tagname="LoansToolBarWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 92px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Select Investment</h3>
    <table style="width: 100%;">
        <tr>
            <td class="style1">
                &nbsp;
                Investment:</td>
            <td>
                &nbsp;
                <asp:DropDownList ID="cboInvestments" runat="server" 
                    DataSourceID="InvestmentsSqlDataSource" DataTextField="Balance" 
                    DataValueField="InvestmentID" Width="200px" 
                    ondatabound="cboInvestments_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="InvestmentsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    
                    SelectCommand="SELECT InvestmentID, MemberID, InvestmentAmount, ISNULL(dbo.GetTotalInvestmentContribution(InvestmentID), 0) - ISNULL(dbo.GetTotalInvestmentWithdrawal(InvestmentID), 0) AS Balance, ISNULL(dbo.GetTotalInvestmentContribution(InvestmentID), 0) AS TotalDeposit, ISNULL(dbo.GetTotalInvestmentWithdrawal(InvestmentID), 0) AS TotalWithdrawal FROM Investments WHERE (MemberID = @MemberID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#993300" Text="No investment found for the current member"></asp:Label>
                <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtFriend" runat="server" ReadOnly="true" Width="200px" />
                                    <asp:SqlDataSource ID="LoanRepaymentScheduleSqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                        SelectCommand="SELECT RepaymentScheduleId, MemberID, LoanId, RepaymentDate, ExpectedRepaymentAmount, IsPaymentMade, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, Balance FROM RepaymentSchedule WHERE (LoanId = @loanID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="loanID" QueryStringField="lid" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Panel ID="FriendDropDown" runat="server" ScrollBars="None"
                                        Style="max-height: 150px; overflow: auto; border:1px solid red">
                                        <asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" DataKeyNames="RepaymentScheduleId" ForeColor="#333333" 
                                            GridLines="None" OnRowDataBound="FriendGridView_RowDataBound" 
                                            OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged">
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Repayment Date" SortExpression="Repayment Date">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RepaymentDate") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" 
                                                            Text='<%# Bind("RepaymentDate", "{0:D}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="RepaymentScheduleId" 
                                                    HeaderText="RepaymentScheduleId" InsertVisible="False" ReadOnly="True" 
                                                    SortExpression="RepaymentScheduleId" Visible="False" />
                                                <asp:TemplateField HeaderText="Expected Repayment Amount" 
                                                    SortExpression="ExpectedRepaymentAmount">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" 
                                                            Text='<%# Bind("ExpectedRepaymentAmount") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" 
                                                            Text='<%# Bind("ExpectedRepaymentAmount", "{0:C}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Balance" HeaderText="Balance" 
                                                    SortExpression="Balance" />
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <cc1:DropDownExtender ID="DropDownExtender1" runat="server" 
                                        DropDownControlID="FriendDropDown" TargetControlID="txtFriend" />
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
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Continue</asp:LinkButton>
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
