<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="InvestmentContribution.aspx.cs" Inherits="LoanWebApplication4.InvestmentContribution" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../UserControls/InvestmentToolBarWebUserControl.ascx" tagname="InvestmentToolBarWebUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/PaymentMethodWebUserControl.ascx" tagname="PaymentMethodWebUserControl" tagprefix="uc2" %>
<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 159px;
        }
        .style4
        {
            width: 164px;
        }
        .style6
        {
            width: 191px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("InvestmentDetails").ready(function ($) {
            if ($('#memberDetails').height() > $('#InvestmentDetails').height()) {
                $('#InvestmentDetails').height($('#memberDetails').height()); /* */
            }
            else if ($('#memberDetails').height() > $('#InvestmentDetails').height()) {
                $('#memberDetails').height($('#InvestmentDetails').height()); /* */
            }
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <h2>
                    Member Contribution<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </h2>
            </td>
            <td align="right">
                <uc1:InvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl1" 
                    runat="server" />
            </td>
        </tr>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 49%" valign="top">
                <div class="DataSection" id="memberDetails">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 170px">
                                <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2" runat="server" />
                            </td>
                            <td valign="top">
                                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" DataSourceID="MemberSqlDataSource1"
                                    Width="569px">
                                    <EditItemTemplate>
                                        MemberId:
                                        <asp:Label ID="MemberIdLabel1" runat="server" Text='<%# Eval("MemberId") %>' />
                                        <br />
                                        MemberFirstName:
                                        <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Text='<%# Bind("MemberFirstName") %>' />
                                        <br />
                                        MemberLastName:
                                        <asp:TextBox ID="MemberLastNameTextBox" runat="server" Text='<%# Bind("MemberLastName") %>' />
                                        <br />
                                        MemberPhoto:
                                        <asp:TextBox ID="MemberPhotoTextBox" runat="server" Text='<%# Bind("MemberPhoto") %>' />
                                        <br />
                                        Balance:
                                        <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                                        <br />
                                        MemberBranch:
                                        <asp:TextBox ID="MemberBranchTextBox" runat="server" Text='<%# Bind("MemberBranch") %>' />
                                        <br />
                                        CreatedBy:
                                        <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                                        <br />
                                        CreatedDate:
                                        <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                                        <br />
                                        ModifiedBy:
                                        <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>' />
                                        <br />
                                        ModifiedDate:
                                        <asp:TextBox ID="ModifiedDateTextBox" runat="server" Text='<%# Bind("ModifiedDate") %>' />
                                        <br />
                                        AccountNumber:
                                        <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        MemberFirstName:
                                        <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Text='<%# Bind("MemberFirstName") %>' />
                                        <br />
                                        MemberLastName:
                                        <asp:TextBox ID="MemberLastNameTextBox" runat="server" Text='<%# Bind("MemberLastName") %>' />
                                        <br />
                                        MemberPhoto:
                                        <asp:TextBox ID="MemberPhotoTextBox" runat="server" Text='<%# Bind("MemberPhoto") %>' />
                                        <br />
                                        Balance:
                                        <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                                        <br />
                                        MemberBranch:
                                        <asp:TextBox ID="MemberBranchTextBox" runat="server" Text='<%# Bind("MemberBranch") %>' />
                                        <br />
                                        CreatedBy:
                                        <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                                        <br />
                                        CreatedDate:
                                        <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                                        <br />
                                        ModifiedBy:
                                        <asp:TextBox ID="ModifiedByTextBox" runat="server" Text='<%# Bind("ModifiedBy") %>' />
                                        <br />
                                        ModifiedDate:
                                        <asp:TextBox ID="ModifiedDateTextBox" runat="server" Text='<%# Bind("ModifiedDate") %>' />
                                        <br />
                                        AccountNumber:
                                        <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style3">
                                                    <b>First Name:</b>
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberFirstNameLabel" runat="server" Text='<%# Bind("MemberFirstName") %>' />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <b>Last Name:</b>
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberLastNameLabel" runat="server" Text='<%# Bind("MemberLastName") %>' />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <%-- <tr>
                        <td class="style1">
                            <b>Balance:</b></td>
                        <td>
                            <asp:Label ID="BalanceLabel" runat="server" Text='<%# Bind("Balance") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>
                                            <tr>
                                                <td class="style3">
                                                    <b>Branch:</b>
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberBranchLabel" runat="server" Text='<%# Bind("MemberBranch") %>' />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <b>Account Number:</b>
                                                </td>
                                                <td>
                                                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Bind("AccountNumber") %>' />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                    SelectCommand="SELECT Members.MemberId AS Expr1, Members.MemberFirstName, Members.MemberLastName, Members.MemberPhoto, Members.MemberBranch, Members.ModifiedDate, Members.AccountNumber, Members.OtherName, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, LoanDurations.Description AS LoanDurationDescription, RepaymentFrequencies.Description AS CointributionFrequencyDescription, InterestRateTypes.Description AS InterestRateTypeDescription, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedDeduction(Investments.InvestmentID) AS TotalAppliedDeductions, dbo.GetBalance(Investments.InvestmentID) AS Balance, dbo.GetTotalAppliedInterest(Investments.InvestmentID) AS TotalInterest FROM Members INNER JOIN Investments ON Members.MemberId = Investments.MemberID LEFT OUTER JOIN InterestRateTypes ON Investments.InterestTypeId = InterestRateTypes.InterestRateTypeId LEFT OUTER JOIN RepaymentFrequencies ON Investments.ContributionFrequencyId = RepaymentFrequencies.RepaymentFrequencyId LEFT OUTER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId WHERE (Members.MemberId = @MemberId) AND (Investments.InvestmentID = @InvestmentID)"
                                    
                                    
                                    
                                    UpdateCommand="UPDATE Members SET Balance = Balance + @DepositAmount WHERE (MemberId = @MemberId)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
                                        <asp:QueryStringParameter Name="InvestmentID" QueryStringField="InvId" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="DepositAmount" />
                                        <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td style="width: 1%" valign="top">
            </td>
            <td style="width: 49%" valign="top">
                <div class="DataSection" id="InvestmentDetails">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="Expr1,InvestmentID" DataSourceID="MemberSqlDataSource1"
                        Width="100%">
                       
                        <ItemTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td class="style6">
                                        Total Contribution:</td>
                                    <td>
                                        <asp:Label ID="TotalContributionLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalContribution", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        Total Withdrawal:
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalWithdrawalLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalWithdrawal", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        Total Applied Interest:</td>
                                    <td>
                                        <asp:Label ID="TotalAppliedInterestLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalInterest", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        Total Applied Deductions:</td>
                                    <td>
                                        <asp:Label ID="TotalAppliedDeductionLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalAppliedDeductions", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        Outstanding Balance:
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" CssClass="bold" 
                                            Text='<%# Eval("Balance", "{0:C}") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <br />
                </div>
            </td>
        </tr>
    </table>
    <h3>
        New Contribution</h3>
    <div class="seperator">
    </div>
    <div class="DataSection">
        <uc2:PaymentMethodWebUserControl ID="PaymentMethodWebUserControl1" 
            runat="server" />
        <table style="width: 100%;">
            <tr>
                <td class="style4">
                    Contribution Amount:
                </td>
                <td>
                    <asp:TextBox ID="ContributionAmountTextBox" runat="server" 
                        Text='<%# Bind("ContributionAmount") %>' Width="300px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ContributionAmountTextBox" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Contribution By:
                </td>
                <td>
                    <asp:TextBox ID="ContributionByTextBox" runat="server" 
                        Text='<%# Bind("ContributionBy") %>' Width="300px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ContributionByTextBox" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Contribution Date:</td>
                <td>
                    <uc3:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                </td>
                <td>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Save" onclick="InsertButton_Click" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <h3>
        Contribution History</h3>
    <div class="seperator">
    </div>
    <div class="DataSection">
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ContributionId" DataSourceID="WithdrawalHistorySqlDataSource1"
            ForeColor="#333333" GridLines="None" AllowPaging="True" EmptyDataText="No Contribution">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete the selected deposite? This action cannot be reversed.');"
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="CreatedDate" HeaderText="Contribution Date" SortExpression="CreatedDate">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ContributionId" HeaderText="ContributionId" SortExpression="ContributionId"
                    InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="InvestmentId" HeaderText="InvestmentId" SortExpression="InvestmentId"
                    Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ContributionAmount" HeaderText="Contribution Amount" SortExpression="ContributionAmount">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy"
                    Visible="False"></asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"
                    Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ContributionBy" HeaderText="Contribution By" SortExpression="ContributionBy">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="RecievedBy" HeaderText="Recieved By" SortExpression="RecievedBy">
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
        <asp:SqlDataSource ID="WithdrawalHistorySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM Contributions WHERE (ContributionId = @ContributionId)"
            InsertCommand="INSERT INTO Contributions(InvestmentId, ContributionAmount, Description, ContributionBy, RecievedBy) VALUES (@InvestmentId, @ContributionAmount, @Description, @ContributionBy, @RecievedBy)"
            SelectCommand="SELECT ContributionId, InvestmentId, ContributionAmount, CreatedDate, CreatedBy, Description, ContributionBy, RecievedBy, ContributionScheduleID, ContributionAmountInWords, ReceiptNumber, IsDeleted FROM Contributions WHERE (InvestmentId = @InvestmentId) AND (IsDeleted &lt;&gt; 1)"
            UpdateCommand="UPDATE [Contributions] SET [InvestmentId] = @InvestmentId, [ContributionAmount] = @ContributionAmount, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [Description] = @Description, [ContributionBy] = @ContributionBy, [RecievedBy] = @RecievedBy WHERE [ContributionId] = @ContributionId"
            OnInserted="WithdrawalHistorySqlDataSource1_Inserted" 
            ondeleting="item_Deleting" onupdating="item_Updating">
            <DeleteParameters>
                <asp:Parameter Name="ContributionId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="InvestmentId" QueryStringField="InvId" 
                    Type="Int32" />
                <asp:Parameter Name="ContributionAmount" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="ContributionBy" />
                <asp:SessionParameter Name="RecievedBy" SessionField="CurrentUser_session" />
                <asp:Parameter Name="ContributionScheduleID" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="InvestmentId" QueryStringField="InvId" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="InvestmentId" Type="Int32" />
                <asp:Parameter Name="ContributionAmount" Type="Decimal" />
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ContributionBy" Type="String" />
                <asp:Parameter Name="RecievedBy" Type="String" />
                <asp:Parameter Name="ContributionId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
