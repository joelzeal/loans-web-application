<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="LoanRepayment.aspx.cs" Inherits="LoanWebApplication4.admin.LoanRepayment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/LoansToolBarWebUserControl.ascx" TagName="LoansToolBarWebUserControl"
    TagPrefix="uc1" %>
<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 115px;
        }
        .style3
        {
            width: 165px;
        }
        .style4
        {
            width: 491px;
        }
        .style6
        {
            width: 246px;
        }
        .style7
        {
        }
        .style8
        {
            width: 50%;
            height: 318px;
        }
        .style9
        {
            width: 179px;
        }
        .style14
        {
            width: 227px;
        }
        .style15
        {
            width: 236px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $("MainContent_DivRepaymentDetails").ready(function ($) {
            $('#MainContent_DivRepaymentDetails').height($('#MainContent_DivRepaymentDetails').height()); /* */
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <h2>
                    Loan Repayment
                </h2>
            </td>
            <td align="right">
                <uc1:LoansToolBarWebUserControl ID="LoansToolBarWebUserControl1" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:SqlDataSource ID="LoansSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Loans] WHERE ([LoanID] = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
        SelectCommand="SELECT Members.MemberId, Members.MemberFirstName, Members.MemberLastName, Members.MemberPhoto, Members.Balance, Members.MemberBranch, Members.CreatedBy, Members.CreatedDate, Members.ModifiedBy, Members.ModifiedDate, Members.AccountNumber, Members.CurrentLoanId, Members.Fax, Members.Telephone, Members.Address, Members.ResidentialAddress, Members.BusinessAddress, Members.Gender, Members.OtherName, Members.ContactPerson, Members.IdentityTypeID, Members.IdentityNumber, Members.DOB, Members.Mobile, Members.IsDeleted, Members.Signature, Members.IDPhoto, Members.OccupationID, Members.ContactPersonPhone, Members.NextOfKin, Members.NextOfKinTelephone, Members.AccountTypeID, Members.BranchID, Branches.BranchName FROM Members INNER JOIN Branches ON Members.BranchID = Branches.BranchID WHERE (Members.MemberId = @MemberId)" 
        UpdateCommand="UPDATE Members SET Balance = Balance - @WithdrawalAmount WHERE (MemberId = @MemberId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WithdrawalAmount" />
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="ScheduleIDHiddenField" runat="server" />
    <table border="0" cellpadding="0" cellspacing="0" width="100%" 
        style="height: 352px">
        <tr valign="top">
            <td class="style7">
                <div class="DataSection" id="DivMemberDetails" runat="server" style="height: 300px">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td style="width: 170px">
                                <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2" runat="server" />
                            </td>
                            <td valign="top">
                                <asp:FormView ID="FormView12" runat="server" DataKeyNames="MemberId" DataSourceID="MemberSqlDataSource1"
                                    Width="423px">
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
                                                <td class="style2">
                                                    First Name:
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberFirstNameLabel" runat="server" Text='<%# Bind("MemberFirstName") %>'
                                                        Style="font-weight: 700" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    Last Name:
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberLastNameLabel" runat="server" Text='<%# Bind("MemberLastName") %>'
                                                        Style="font-weight: 700" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <%-- <tr>
                                    <td class="style1">
                                        <b>Balance:</b>
                                    </td>
                                    <td>
                                        <asp:Label ID="BalanceLabel" runat="server" Text='<%# Bind("Balance") %>' Style="font-weight: 700" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>--%>
                                            <tr>
                                                <td class="style2">
                                                    Other Name:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Style="font-weight: 700" Text='<%# Eval("OtherName") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    Date of Birth
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Style="font-weight: 700" Text='<%# Eval("DOB", "{0:D}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    Branch:
                                                </td>
                                                <td>
                                                    <asp:Label ID="MemberBranchLabel" runat="server" Text='<%# Bind("BranchName") %>'
                                                        Style="font-weight: 700" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    Account Number:
                                                </td>
                                                <td>
                                                    <asp:Label ID="AccountNumberLabel" runat="server" Text='<%# Bind("AccountNumber") %>'
                                                        Style="font-weight: 700" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Utils.IdentityType( Eval("IdentityTypeID")) %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Style="font-weight: 700" Text='<%# Eval("IdentityNumber") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="style8">
                <div class="DataSection" id="DivRepaymentDetails" runat="server" style="float: right;
                    width: 95%; height: 300px">
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="LoanID" DataSourceID="LoansSqlDataSource"
                        Width="617px">
                        <EditItemTemplate>
                            LoanID:
                            <asp:Label ID="LoanIDLabel1" runat="server" Text='<%# Eval("LoanID") %>' />
                            <br />
                            MemberId:
                            <asp:TextBox ID="MemberIdTextBox" runat="server" Text='<%# Bind("MemberId") %>' />
                            <br />
                            Interest:
                            <asp:TextBox ID="InterestTextBox" runat="server" Text='<%# Bind("Interest") %>' />
                            <br />
                            InterestTypeId:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" Text='<%# Bind("InterestTypeId") %>' />
                            <br />
                            Principal:
                            <asp:TextBox ID="PrincipalTextBox" runat="server" Text='<%# Bind("Principal") %>' />
                            <br />
                            Amount:
                            <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                            <br />
                            payWithContribution:
                            <asp:CheckBox ID="payWithContributionCheckBox" runat="server" Checked='<%# Bind("payWithContribution") %>' />
                            <br />
                            RepaymentFrequencyId:
                            <asp:TextBox ID="RepaymentFrequencyIdTextBox" runat="server" Text='<%# Bind("RepaymentFrequencyId") %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            ExpectedRepaymentEndDate:
                            <asp:TextBox ID="ExpectedRepaymentEndDateTextBox" runat="server" Text='<%# Bind("ExpectedRepaymentEndDate") %>' />
                            <br />
                            ActualRepaymentEndDate:
                            <asp:TextBox ID="ActualRepaymentEndDateTextBox" runat="server" Text='<%# Bind("ActualRepaymentEndDate") %>' />
                            <br />
                            IsPaidup:
                            <asp:CheckBox ID="IsPaidupCheckBox" runat="server" Checked='<%# Bind("IsPaidup") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            MemberId:
                            <asp:TextBox ID="MemberIdTextBox" runat="server" Text='<%# Bind("MemberId") %>' />
                            <br />
                            Interest:
                            <asp:TextBox ID="InterestTextBox" runat="server" Text='<%# Bind("Interest") %>' />
                            <br />
                            Interest Type:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" Text='<%# Utils.InterestTypeName((int)Eval("InterestTypeId")) %>' />
                            <br />
                            Principal:
                            <asp:TextBox ID="PrincipalTextBox" runat="server" Text='<%# Bind("Principal") %>' />
                            <br />
                            Amount:
                            <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                            <br />
                            payWithContribution:
                            <asp:CheckBox ID="payWithContributionCheckBox" runat="server" Checked='<%# Bind("payWithContribution") %>' />
                            <br />
                            RepaymentFrequencyId:
                            <asp:TextBox ID="RepaymentFrequencyIdTextBox" runat="server" Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            ExpectedRepaymentEndDate:
                            <asp:TextBox ID="ExpectedRepaymentEndDateTextBox" runat="server" Text='<%# Bind("ExpectedRepaymentEndDate") %>' />
                            <br />
                            ActualRepaymentEndDate:
                            <asp:TextBox ID="ActualRepaymentEndDateTextBox" runat="server" Text='<%# Bind("ActualRepaymentEndDate") %>' />
                            <br />
                            IsPaidup:
                            <asp:CheckBox ID="IsPaidupCheckBox" runat="server" Checked='<%# Bind("IsPaidup") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td class="style14">
                                        Interest:
                                    </td>
                                    <td>
                                        <asp:Label ID="InterestLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Eval("Interest") + "%" %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Interest Type:
                                    </td>
                                    <td>
                                        <asp:Label ID="InterestTypeIdLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Utils.InterestTypeName((int)Eval("InterestTypeId")) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Principal:
                                    </td>
                                    <td>
                                        <asp:Label ID="PrincipalLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Bind("Principal", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Amount:</td>
                                    <td>
                                        <asp:Label ID="AmountLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Bind("Amount", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Duration:</td>
                                    <td>
                                        <asp:Label ID="DurationLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Eval("Duration") + " Months" %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Repayment Frequency:</td>
                                    <td>
                                        <asp:Label ID="RepaymentFrequencyIdLabel" runat="server" 
                                            Style="font-weight: 700" 
                                            Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="RepaymentFrequencyIdLabel0" runat="server" 
                                            Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) +" Repayment" %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Style="font-weight: 700" 
                                            Text='<%# Eval("RepaymentFreqAmount", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Loan Date:</td>
                                    <td>
                                        <asp:Label ID="CreatedDateLabel" runat="server" Style="font-weight: 700" 
                                            Text='<%# Bind("CreatedDate", "{0:D}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Expected Repayment End Date:</td>
                                    <td>
                                        <asp:Label ID="ExpectedRepaymentEndDateLabel" runat="server" 
                                            Style="font-weight: 700" 
                                            Text='<%# Bind("ExpectedRepaymentEndDate", "{0:D}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Actual Repayment End Date:</td>
                                    <td>
                                        <asp:Label ID="ActualRepaymentEndDateLabel" runat="server" 
                                            Style="font-weight: 700" Text='<%# Bind("ActualRepaymentEndDate", "{0:D}") %>'></asp:Label>
                                    </td>
                                 
                                </tr>
                                <tr>
                                    <td class="style14">
                                        Loan Stauts:</td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Style="font-weight: 700" 
                                            Text='<%# Utils.LoanStatus( (bool)Eval("IsPaidup")) %>'></asp:Label>
                                    </td>
                                    
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td class="style15">
                    &nbsp;Balance:</td>
                            <td> <asp:Label ID="lblLoanBalance" runat="server" Style="font-weight: 700" Text="Label"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td class="style15">&nbsp;Total Repayment:
                            </td>
                            <td> <asp:Label ID="lblTotalRepayment" runat="server" Style="font-weight: 700" Text="Label"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td class="style15">&nbsp;<asp:Literal ID="LitPenaltyLabel" runat="server">Total Penalty:</asp:Literal>
                            </td>
                            <td><asp:Label ID="lblTotalPenalty" runat="server" Style="font-weight: 700; color: #800000;"
                        Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
     <h3><b>
      Repayment Details </b></h3>
    <div class="seperator">
    </div>
    <div class="DataSection" runat="server" id="DivNewRepayment">
        <table style="width: 100%;">
            <tr>
                <td class="style3">
                    Schedule Date:
                </td>
                <td class="style4" style="padding-left: 3px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtFriend" runat="server" ReadOnly="true" Width="300px" />
                            <asp:SqlDataSource ID="LoanRepaymentScheduleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT RepaymentScheduleId, MemberID, LoanId, RepaymentDate, ExpectedRepaymentAmount, IsPaymentMade, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, Balance FROM RepaymentSchedule WHERE (LoanId = @loanID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="loanID" QueryStringField="lid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Panel ID="FriendDropDown" runat="server" ScrollBars="None" Style="max-height: 150px;
                                overflow: auto; border: 1px solid red">
                                <asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    DataKeyNames="RepaymentScheduleId" ForeColor="#333333" GridLines="None" OnRowDataBound="FriendGridView_RowDataBound"
                                    OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged">
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Repayment Date" SortExpression="Repayment Date">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RepaymentDate") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RepaymentDate", "{0:D}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RepaymentScheduleId" HeaderText="RepaymentScheduleId"
                                            InsertVisible="False" ReadOnly="True" SortExpression="RepaymentScheduleId" Visible="False" />
                                        <asp:TemplateField HeaderText="Expected Repayment Amount" SortExpression="ExpectedRepaymentAmount">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExpectedRepaymentAmount") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExpectedRepaymentAmount", "{0:C}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                            </asp:Panel>
                            <cc1:DropDownExtender ID="DropDownExtender1" runat="server" DropDownControlID="FriendDropDown"
                                TargetControlID="txtFriend" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="FriendGridView" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td valign="top">
                    &nbsp;
                    <asp:Label ID="ErrorLabel" runat="server" Font-Bold="True" ForeColor="#CC3300" Text="Label"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Repayment Amount:
                </td>
                <td class="style4">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style9">
                                <asp:TextBox ID="RepaymentAmountTextBox" runat="server" Text='<%# Bind("RepaymentAmount") %>'
                                    Width="300px" ValidationGroup="g1" />
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="g3">Remove Investment</asp:LinkButton>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/notes.gif" Width="22px"
                                    OnClick="ImageButton2_Click" ToolTip="Pay with an investment" ValidationGroup="g2" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RepaymentAmountTextBox"
                                    ErrorMessage="Repayment Required" ForeColor="#CC3300" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Repayment Date:</td>
                <td class="style9">
                &nbsp;<uc2:DateWebUserControl ID="DateWebUserControl1" runat="server" />
            
             </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Paid By:
                </td>
                <td class="style4">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style6">
                                <asp:TextBox ID="PaidTextBox" runat="server" Text='<%# Bind("RepaymentBy") %>' Width="300px"
                                    ValidationGroup="g1" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PaidTextBox"
                                    ErrorMessage="Paid by is required" ForeColor="#CC3300" 
                                    ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
                <td class="style4">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Save" OnClick="InsertButton_Click" ValidationGroup="g1" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="RepaymentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM Repayments WHERE (RepaymentId = @RepaymentId)"
            InsertCommand="INSERT INTO Repayments(LoanId, RepaymentAmount, Description, RepaymentBy) VALUES (@LoanId, @RepaymentAmount, @Description, @RepaymentBy)"
            SelectCommand="SELECT RepaymentId, LoanId, RepaymentAmount, CreatedDate, CreatedBy, Description, RepaymentBy, RepaymentScheduleID, RepaidWithInvestmentID, ReceiptNumber, RepaymentAmountInWords, InterestPayment, PrincipalPayment, isDeleted FROM Repayments WHERE (LoanId = @LoanId) AND (isDeleted &lt;&gt; 1)"
            UpdateCommand="UPDATE [Repayments] SET [LoanId] = @LoanId, [RepaymentAmount] = @RepaymentAmount, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [Description] = @Description, [RepaymentBy] = @RepaymentBy WHERE [RepaymentId] = @RepaymentId"
            OnInserted="RepaymentSqlDataSource_Inserted" ondeleting="item_Deleting" 
            onupdating="item_Updating">
            <DeleteParameters>
                <asp:Parameter Name="RepaymentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="LoanId" QueryStringField="lid" Type="Int32" />
                <asp:Parameter Name="RepaymentAmount" Type="Decimal" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="RepaymentBy" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="LoanId" QueryStringField="lid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="LoanId" Type="Int32" />
                <asp:Parameter Name="RepaymentAmount" Type="Decimal" />
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="RepaymentBy" Type="String" />
                <asp:Parameter Name="RepaymentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <%--<asp:HyperLinkField DataNavigateUrlFields="RepaymentId" 
                DataNavigateUrlFormatString="~/admin/ConfirmCancelPayment.aspx?rid={0}" 
                NavigateUrl="~/admin/ConfirmCancelPayment.aspx" Text="Cancel Payment">
            <HeaderStyle Width="150px" /></asp:HyperLinkField>--%>
    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="RepaymentId" DataSourceID="RepaymentSqlDataSource"
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete the selected payment? This action cannot be reversed.');"
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RepaymentId" HeaderText="RepaymentId" ReadOnly="True"
                SortExpression="RepaymentId" Visible="False" />
            <asp:BoundField DataField="LoanId" HeaderText="LoanId" SortExpression="LoanId" Visible="False" />
            <asp:BoundField DataField="RepaymentAmount" HeaderText="RepaymentAmount" SortExpression="RepaymentAmount"
                DataFormatString="{0:C}">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Payment Date" SortExpression="CreatedDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreatedDate", "{0:G}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy"
                Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"
                Visible="False" />
            <asp:BoundField DataField="RepaymentBy" HeaderText="Repayment By" SortExpression="RepaymentBy">
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
