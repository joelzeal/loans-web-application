<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="FixedDepositInvestmentWithdrawal.aspx.cs" Inherits="LoanWebApplication4.FixedDepositInvestmentWithdrawal" %>

<%@ Register src="~/UserControls/FixedDepositInvestmentToolBarWebUserControl.ascx" tagname="InvestmentToolBarWebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style6
        {
            width: 144px;
        }
        .style7
        {
            width: 123px;
        }
    </style>

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
   <%-- <script type="text/javascript">
        $("memberDetails").ready(function ($) {
            $('#InvestmentDetails').height($('#memberDetails').height()); /* */
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
         &nbsp;&nbsp;&nbsp;
   
         <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>   Member Fixed Deposit Withdrawal </h2>
            </td>
             <td align="right">
                 <uc1:InvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl1" 
                     runat="server" />
            </td>
        </tr>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width:49%" valign="top">
            <div class="DataSection" id="memberDetails">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:170px">
                <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2"  runat="server" />
                </td>

                <td valign="top">
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" 
            DataSourceID="LinqDataSource1" Width="569px">
            <EditItemTemplate>
                MemberId:
                <asp:Label ID="MemberIdLabel1" runat="server" Text='<%# Eval("MemberId") %>' />
                <br />
                MemberFirstName:
                <asp:TextBox ID="MemberFirstNameTextBox" runat="server" 
                    Text='<%# Bind("MemberFirstName") %>' />
                <br />
                MemberLastName:
                <asp:TextBox ID="MemberLastNameTextBox" runat="server" 
                    Text='<%# Bind("MemberLastName") %>' />
                <br />
                MemberPhoto:
                <asp:TextBox ID="MemberPhotoTextBox" runat="server" 
                    Text='<%# Bind("MemberPhoto") %>' />
                <br />
                Balance:
                <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                <br />
                MemberBranch:
                <asp:TextBox ID="MemberBranchTextBox" runat="server" 
                    Text='<%# Bind("MemberBranch") %>' />
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
                AccountNumber:
                <asp:TextBox ID="AccountNumberTextBox" runat="server" 
                    Text='<%# Bind("AccountNumber") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                MemberFirstName:
                <asp:TextBox ID="MemberFirstNameTextBox" runat="server" 
                    Text='<%# Bind("MemberFirstName") %>' />
                <br />
                MemberLastName:
                <asp:TextBox ID="MemberLastNameTextBox" runat="server" 
                    Text='<%# Bind("MemberLastName") %>' />
                <br />
                MemberPhoto:
                <asp:TextBox ID="MemberPhotoTextBox" runat="server" 
                    Text='<%# Bind("MemberPhoto") %>' />
                <br />
                Balance:
                <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                <br />
                MemberBranch:
                <asp:TextBox ID="MemberBranchTextBox" runat="server" 
                    Text='<%# Bind("MemberBranch") %>' />
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
                AccountNumber:
                <asp:TextBox ID="AccountNumberTextBox" runat="server" 
                    Text='<%# Bind("AccountNumber") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="style6">
                            <b>First Name:</b></td>
                        <td>
                            <asp:Label ID="MemberFirstNameLabel" runat="server" 
                                Text='<%# Bind("MemberFirstName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <b>Last Name:</b></td>
                        <td>
                            <asp:Label ID="MemberLastNameLabel" runat="server" 
                                Text='<%# Bind("MemberLastName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
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
                        <td class="style6">
                            <b>Branch:</b></td>
                        <td>
                            <asp:Label ID="MemberBranchLabel" runat="server" 
                                Text='<%# Bind("MemberBranch") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <b>Account Number:</b></td>
                        <td>
                            <asp:Label ID="AccountNumberLabel" runat="server" 
                                Text='<%# Bind("AccountNumber") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                        ContextTypeName="LoanWebApplication4.FinanceManagerDataContext" 
                        EntityTypeName="" TableName="vwMemberFixedDepositInvestment_MemberDetailsAddeds" 
                        Where="InvestmentID == @InvestmentID &amp;&amp; MemberId == @MemberId">
                        <WhereParameters>
                            <asp:QueryStringParameter Name="InvestmentID" QueryStringField="InvId" 
                                Type="Int32" />
                            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
      
    </div>
            </td>
             <td style="width:1%" valign="top">
            </td>
             <td style="width:49%" valign="top">
                <div class="DataSection" id="InvestmentDetails">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="InvestmentID" 
                        DataSourceID="LinqDataSource1" Width="100%" 
                        ondatabound="FormView3_DataBound">
                        <EditItemTemplate>
                           
                            MemberFirstName:
                            <asp:TextBox ID="MemberFirstNameTextBox" runat="server" 
                                Text='<%# Bind("MemberFirstName") %>' />
                            <br />
                            MemberLastName:
                            <asp:TextBox ID="MemberLastNameTextBox" runat="server" 
                                Text='<%# Bind("MemberLastName") %>' />
                            <br />
                            MemberPhoto:
                            <asp:TextBox ID="MemberPhotoTextBox" runat="server" 
                                Text='<%# Bind("MemberPhoto") %>' />
                            <br />
                            MemberBranch:
                            <asp:TextBox ID="MemberBranchTextBox" runat="server" 
                                Text='<%# Bind("MemberBranch") %>' />
                            <br />
                            ModifiedDate:
                            <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                                Text='<%# Bind("ModifiedDate") %>' />
                            <br />
                            AccountNumber:
                            <asp:TextBox ID="AccountNumberTextBox" runat="server" 
                                Text='<%# Bind("AccountNumber") %>' />
                            <br />
                            OtherName:
                            <asp:TextBox ID="OtherNameTextBox" runat="server" 
                                Text='<%# Bind("OtherName") %>' />
                            <br />
                            TotalContribution:
                            <asp:TextBox ID="TotalContributionTextBox" runat="server" 
                                Text='<%# Bind("TotalContribution") %>' />
                            <br />
                            InvestmentID:
                            <asp:Label ID="InvestmentIDLabel1" runat="server" 
                                Text='<%# Eval("InvestmentID") %>' />
                            <br />
                            MemberID:
                            <asp:TextBox ID="MemberIDTextBox" runat="server" 
                                Text='<%# Bind("MemberID") %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" 
                                Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            CreatedBy:
                            <asp:TextBox ID="CreatedByTextBox" runat="server" 
                                Text='<%# Bind("CreatedBy") %>' />
                            <br />
                            InsterstRate:
                            <asp:TextBox ID="InsterstRateTextBox" runat="server" 
                                Text='<%# Bind("InsterstRate") %>' />
                            <br />
                            InvestmentAmount:
                            <asp:TextBox ID="InvestmentAmountTextBox" runat="server" 
                                Text='<%# Bind("InvestmentAmount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" 
                                Text='<%# Bind("Duration") %>' />
                            <br />
                            Balance:
                            <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                            <br />
                            GroupId:
                            <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                            <br />
                            ContributionFrequencyId:
                            <asp:TextBox ID="ContributionFrequencyIdTextBox" runat="server" 
                                Text='<%# Bind("ContributionFrequencyId") %>' />
                            <br />
                            InterestTypeId:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" 
                                Text='<%# Bind("InterestTypeId") %>' />
                            <br />
                            MaturityDate:
                            <asp:TextBox ID="MaturityDateTextBox" runat="server" 
                                Text='<%# Bind("MaturityDate") %>' />
                            <br />
                            ContributionFreqAmount:
                            <asp:TextBox ID="ContributionFreqAmountTextBox" runat="server" 
                                Text='<%# Bind("ContributionFreqAmount") %>' />
                            <br />
                            InvestmentCalculationStartDate:
                            <asp:TextBox ID="InvestmentCalculationStartDateTextBox" runat="server" 
                                Text='<%# Bind("InvestmentCalculationStartDate") %>' />
                            <br />
                            IsMatured:
                            <asp:CheckBox ID="IsMaturedCheckBox" runat="server" 
                                Checked='<%# Bind("IsMatured") %>' />
                            <br />
                            DurationTypeId:
                            <asp:TextBox ID="DurationTypeIdTextBox" runat="server" 
                                Text='<%# Bind("DurationTypeId") %>' />
                            <br />
                            MaturedAmount:
                            <asp:TextBox ID="MaturedAmountTextBox" runat="server" 
                                Text='<%# Bind("MaturedAmount") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            MemberFirstName:
                            <asp:TextBox ID="MemberFirstNameTextBox" runat="server" 
                                Text='<%# Bind("MemberFirstName") %>' />
                            <br />
                            MemberLastName:
                            <asp:TextBox ID="MemberLastNameTextBox" runat="server" 
                                Text='<%# Bind("MemberLastName") %>' />
                            <br />
                            MemberPhoto:
                            <asp:TextBox ID="MemberPhotoTextBox" runat="server" 
                                Text='<%# Bind("MemberPhoto") %>' />
                            <br />
                            MemberBranch:
                            <asp:TextBox ID="MemberBranchTextBox" runat="server" 
                                Text='<%# Bind("MemberBranch") %>' />
                            <br />
                            ModifiedDate:
                            <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                                Text='<%# Bind("ModifiedDate") %>' />
                            <br />
                            AccountNumber:
                            <asp:TextBox ID="AccountNumberTextBox" runat="server" 
                                Text='<%# Bind("AccountNumber") %>' />
                            <br />
                            OtherName:
                            <asp:TextBox ID="OtherNameTextBox" runat="server" 
                                Text='<%# Bind("OtherName") %>' />
                            <br />
                            TotalContribution:
                            <asp:TextBox ID="TotalContributionTextBox" runat="server" 
                                Text='<%# Bind("TotalContribution") %>' />
                            <br />

                            MemberID:
                            <asp:TextBox ID="MemberIDTextBox" runat="server" 
                                Text='<%# Bind("MemberID") %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" 
                                Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            CreatedBy:
                            <asp:TextBox ID="CreatedByTextBox" runat="server" 
                                Text='<%# Bind("CreatedBy") %>' />
                            <br />
                            InsterstRate:
                            <asp:TextBox ID="InsterstRateTextBox" runat="server" 
                                Text='<%# Bind("InsterstRate") %>' />
                            <br />
                            InvestmentAmount:
                            <asp:TextBox ID="InvestmentAmountTextBox" runat="server" 
                                Text='<%# Bind("InvestmentAmount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" 
                                Text='<%# Bind("Duration") %>' />
                            <br />
                            Balance:
                            <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                            <br />
                            GroupId:
                            <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                            <br />
                            ContributionFrequencyId:
                            <asp:TextBox ID="ContributionFrequencyIdTextBox" runat="server" 
                                Text='<%# Bind("ContributionFrequencyId") %>' />
                            <br />
                            InterestTypeId:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" 
                                Text='<%# Bind("InterestTypeId") %>' />
                            <br />
                            MaturityDate:
                            <asp:TextBox ID="MaturityDateTextBox" runat="server" 
                                Text='<%# Bind("MaturityDate") %>' />
                            <br />
                            ContributionFreqAmount:
                            <asp:TextBox ID="ContributionFreqAmountTextBox" runat="server" 
                                Text='<%# Bind("ContributionFreqAmount") %>' />
                            <br />
                            InvestmentCalculationStartDate:
                            <asp:TextBox ID="InvestmentCalculationStartDateTextBox" runat="server" 
                                Text='<%# Bind("InvestmentCalculationStartDate") %>' />
                            <br />
                            IsMatured:
                            <asp:CheckBox ID="IsMaturedCheckBox" runat="server" 
                                Checked='<%# Bind("IsMatured") %>' />
                            <br />
                            DurationTypeId:
                            <asp:TextBox ID="DurationTypeIdTextBox" runat="server" 
                                Text='<%# Bind("DurationTypeId") %>' />
                            <br />
                            MaturedAmount:
                            <asp:TextBox ID="MaturedAmountTextBox" runat="server" 
                                Text='<%# Bind("MaturedAmount") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Insterst Rate:
                            <asp:Label ID="InsterstRateLabel" runat="server" 
                                Text='<%# "%" + Eval("InsterstRate") %>' style="font-weight: 700" />
                            <br />
                            <%--Interest Type:
                            <asp:Label ID="InterestTypeIdLabel" runat="server" 
                                Text='<%# Eval("InterestRateTypeDescription") %>' CssClass="bold" />
                            <br />--%>
                            Investment Amount:
                            <asp:Label ID="InvestmentAmountLabel" runat="server" 
                                Text='<%# Bind("InvestmentAmount", "{0:C}") %>' CssClass="bold" />
                            <br />
                            Duration:
                            <asp:Label ID="DurationLabel" runat="server" Text='<%# Bind("Duration") %>' 
                                CssClass="bold" />
                            &nbsp;<asp:Label ID="DurationTypeIdLabel" runat="server" 
                                Text='<%# Eval("DurationDescription") %>' CssClass="bold" />
                            <br />
                            Maturity Date:
                            <asp:Label ID="MaturityDateLabel" runat="server" 
                                Text='<%# Bind("MaturityDate", "{0:d}") %>' CssClass="bold" />
                            <br />
                            Is Matured:
                            <asp:CheckBox ID="IsMaturedCheckBox" runat="server" 
                                Checked='<%# Bind("IsMatured") %>' Enabled="False" CssClass="bold" />
                            <br />
                            Matured Amount:
                            <asp:Label ID="MaturedAmountLabel" runat="server" 
                                Text='<%# Bind("MaturedAmount", "{0:C}") %>' CssClass="bold" />
                            <br />
                            Total Contribution:
                            <asp:Label ID="TotalContributionLabel" runat="server" CssClass="bold" 
                                Text='<%# Bind("TotalContribution", "{0:C}") %>' />
                            <br />
                            Total Withdrawal:
                            <asp:Label ID="TotalWithdrawalLabel" runat="server" CssClass="bold" 
                                Text='<%# Bind("TotalWithdrawal", "{0:C}") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </td>
        </tr>
    </table>
    <h3>
        Withdrawal</h3>
        <div class="seperator"></div>
    <div class="DataSection">
        <asp:SqlDataSource ID="WithdrawalHistorySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM [MemberWithdrawals] WHERE [MemberWithdrawalId] = @MemberWithdrawalId"
            InsertCommand="INSERT INTO MemberWithdrawals(MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, Narration, InvestmentID) VALUES (@MemberId, @WithdrawalAmount, @WithdrawnBy, @WithdrawalIssuedByUserName, GETDATE(), @CreatedBy, @Narration, @InvestmentID)"
            SelectCommand="SELECT MemberWithdrawalId, MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, InvestmentID, Narration FROM MemberWithdrawals WHERE (InvestmentID = @InvestmentID)"
            UpdateCommand="UPDATE [MemberWithdrawals] SET [WithdrawalAmount] = @WithdrawalAmount, [WithdrawnBy] = @WithdrawnBy, [WithdrawalIssuedByUserId] = @WithdrawalIssuedByUserId, [DateCreated] = @DateCreated, [CreatedBy] = @CreatedBy WHERE [MemberWithdrawalId] = @MemberWithdrawalId"
            OnInserted="WithdrawalHistorySqlDataSource1_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="MemberWithdrawalId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
                <asp:Parameter Name="WithdrawalAmount" Type="Decimal" />
                <asp:Parameter Name="WithdrawnBy" Type="String" />
                <asp:Parameter Name="DateCreated" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter DefaultValue="Member withdrawal" Name="Narration" />
                <asp:QueryStringParameter DefaultValue="" Name="InvestmentID" 
                    QueryStringField="InvId" />
                <asp:SessionParameter Name="WithdrawalIssuedByUserName" 
                    SessionField="CurrentUser_session" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="InvestmentID" QueryStringField="InvId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="WithdrawalAmount" />
                <asp:Parameter Name="WithdrawnBy" />
                <asp:Parameter Name="WithdrawalIssuedByUserId" />
                <asp:Parameter Name="DateCreated" />
                <asp:Parameter Name="CreatedBy" />
                <asp:Parameter Name="MemberWithdrawalId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table style="width: 100%;">
            <tr>
                <td class="style7">
                    Amount:
                </td>
                <td>
                    <asp:TextBox ID="WithdrawalAmountTextBox" runat="server" 
                        OnTextChanged="WithdrawalAmountTextBox_TextChanged" 
                        Text='<%# Bind("WithdrawalAmount") %>' Width="200px" BackColor="#CCFFCC" 
                        ReadOnly="True" style="text-align: right" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Withdrawal By:
                </td>
                <td>
                    <asp:TextBox ID="WithdrawnByTextBox" runat="server" 
                        Text='<%# Bind("WithdrawnBy") %>' Width="200px" style="text-align: left" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="WithdrawnByTextBox" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="g1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;
                </td>
                <td>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Save" ValidationGroup="g1" 
                        onclick="InsertButton_Click" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </asp:Content>
