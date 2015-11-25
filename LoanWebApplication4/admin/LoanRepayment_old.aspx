<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanRepayment_old.aspx.cs" Inherits="LoanWebApplication4.admin.LoanRepayment1" EnableEventValidation="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>iCredit</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .style2
        {
            width: 115px;
        }
        .style3
        {
            width: 252px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function ($) {
            $('#DivMemberDetails').height($('#DivRepaymentDetails').height()); /* */
        });
    </script>
</head>
<body style="margin: 0; overflow: auto">
    <form id="Form1" runat="server" style="margin: 0">
    <div class="page">
        <div class="header">
            <div class="title">
                <h1 style="font-variant: normal">
                    <%--NUNGUA DISTRICT ASSEMBLIES OF GOD FINANCIAL SERVICE--%>
                    iCredit
                </h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" id="HeadLoginStatus" runat="server">Log In</a>
                        ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><a href="../Account/ChangePassword.aspx">
                            <asp:LoginName ID="HeadLoginName" runat="server" />
                        </a></span>! [
                        <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out"
                            LogoutPageUrl="~/" />
                        ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false"
                                IncludeStyleBlock="false" Orientation="Horizontal" 
                                onmenuitemclick="NavigationMenu_MenuItemClick">
                                <Items>
                                    <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Home" />
                                    <asp:MenuItem Text="Members" Value="Members" NavigateUrl="~/admin/Members.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="Loan" Value="Loan">
                                        <asp:MenuItem NavigateUrl="~/admin/NewLoan.aspx" Text="New Loan" Value="New Loan">
                                        </asp:MenuItem>
                                        <asp:MenuItem Text="Repayment" Value="Repayment" NavigateUrl="~/admin/SearchPage.aspx">
                                        </asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/admin/LoanDefaults.aspx" Text="Defaults" Value="Defaults">
                                        </asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="Investment" Value="Investment">
                                        <asp:MenuItem NavigateUrl="~/admin/NewInvestment.aspx" Text="New investment" 
                                            Value="New investment"></asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/admin/SearchPage.aspx" Text="Contribution" 
                                            Value="Contribution"></asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="Settings" Value="Settings">
                                        <asp:MenuItem NavigateUrl="~/admin/CompanyProfile.aspx" Text="Company Profile" Value="Company Profile">
                                        </asp:MenuItem>
                                        <asp:MenuItem Text="Loan" Value="Loan">
                                            <asp:MenuItem NavigateUrl="~/admin/LoanSsttings.aspx" Text="General" Value="General">
                                            </asp:MenuItem>
                                            <asp:MenuItem NavigateUrl="~/admin/LoanDurations.aspx" Text="Loan Durations" Value="Loan Durations">
                                            </asp:MenuItem>
                                        </asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/admin/RepaymentFrequency.aspx" Text="Loan Repayment Frequency"
                                            Value="Loan Repayment Frequency"></asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/Setups/IdentityTypes.aspx" Text="Identification Types"
                                            Value="Identification Types"></asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/About.aspx" Text="About" Value="About"></asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr valign="middle">
                                    <td>
                                        &nbsp;
                                        <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="../images/searchButton.png" runat="server"
                                            OnClick="ImageButton1_Click" ValidationGroup="vg1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="mainContentDiv" class="main">
             <h2>
        Loan Repayment<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td>
                <div class="DataSection" id="DivMemberDetails" style="height: 100%">
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
                                                    <asp:Label ID="MemberBranchLabel" runat="server" Text='<%# Bind("MemberBranch") %>'
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
            <td style="width: 50%">
                <div class="DataSection" id="DivRepaymentDetails" style="float: right; width: 95%;">
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="LoanID" DataSourceID="LoansSqlDataSource"
                        Width="423px">
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
                            Interest:
                            <asp:Label ID="InterestLabel" runat="server" Style="font-weight: 700" Text='<%# Eval("Interest") + "%" %>' />
                            <br />
                            Interest Type:
                            <asp:Label ID="InterestTypeIdLabel" runat="server" Style="font-weight: 700" Text='<%# Utils.InterestTypeName((int)Eval("InterestTypeId")) %>' />
                            <br />
                            Principal:
                            <asp:Label ID="PrincipalLabel" runat="server" Style="font-weight: 700" Text='<%# Bind("Principal", "{0:C}") %>' />
                            <br />
                            Amount:
                            <asp:Label ID="AmountLabel" runat="server" Style="font-weight: 700" Text='<%# Bind("Amount", "{0:C}") %>' />
                            <br />
                            Duration:
                            <asp:Label ID="DurationLabel" runat="server" Style="font-weight: 700" Text='<%# Eval("Duration") + " Months" %>' />
                            <br />
                            Repayment Frequency:
                            <asp:Label ID="RepaymentFrequencyIdLabel" runat="server" Style="font-weight: 700"
                                Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) %>' />
                            <br />
                            <asp:Label ID="RepaymentFrequencyIdLabel0" runat="server" Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) +" Repayment" %>' />
                            :
                            <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text='<%# Eval("RepaymentFreqAmount", "{0:C}") %>'></asp:Label>
                            <br />
                            Loan Date:
                            <asp:Label ID="CreatedDateLabel" runat="server" Style="font-weight: 700" Text='<%# Bind("CreatedDate", "{0:D}") %>' />
                            <br />
                            Expected Repayment End Date:
                            <asp:Label ID="ExpectedRepaymentEndDateLabel" runat="server" Style="font-weight: 700"
                                Text='<%# Bind("ExpectedRepaymentEndDate", "{0:D}") %>' />
                            <br />
                            Actual Repayment End Date:
                            <asp:Label ID="ActualRepaymentEndDateLabel" runat="server" Style="font-weight: 700"
                                Text='<%# Bind("ActualRepaymentEndDate", "{0:D}") %>' />
                            <br />
                            Loan Stauts:
                            <%--<asp:CheckBox ID="IsPaidupCheckBox" runat="server" 
                                Checked='<%# Bind("IsPaidup") %>' Enabled="false" style="font-weight: 700" />--%>
                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Utils.LoanStatus( (bool)Eval("IsPaidup")) %>'></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    Balance:
                    <asp:Label ID="lblLoanBalance" runat="server" Style="font-weight: 700" Text="Label"></asp:Label>
                    <br />
                    Total Repayment:
                    <asp:Label ID="lblTotalRepayment" runat="server" Style="font-weight: 700" Text="Label"></asp:Label>
                </div>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="LoansSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Loans] WHERE ([LoanID] = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)" UpdateCommand="UPDATE Members SET Balance = Balance - @WithdrawalAmount WHERE (MemberId = @MemberId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WithdrawalAmount" />
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>
        Repayment Details</h3>
            <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="DataSection" id="DivNewRepayment">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtFriend" runat="server" Width="200px" ReadOnly="true" 
                                        AutoPostBack="True" />
                                    <asp:SqlDataSource ID="LoanRepaymentScheduleSqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                        SelectCommand="SELECT RepaymentScheduleId, MemberID, LoanId, RepaymentDate, ExpectedRepaymentAmount, IsPaymentMade, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, Balance FROM RepaymentSchedule WHERE (LoanId = @loanID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="loanID" QueryStringField="lid" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Panel runat="server" ID="FriendDropDown" Style="max-height: 150px; overflow: scroll;">
                                        <asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False"
                                            OnRowDataBound="FriendGridView_RowDataBound" OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="RepaymentScheduleId">
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
                                            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RepaymentId" DataSourceID="RepaymentSqlDataSource"
            DefaultMode="Insert" Width="467px">
            <EditItemTemplate>
                RepaymentId:
                <asp:Label ID="RepaymentIdLabel1" runat="server" Text='<%# Eval("RepaymentId") %>' />
                <br />
                LoanId:
                <asp:TextBox ID="LoanIdTextBox" runat="server" Text='<%# Bind("LoanId") %>' />
                <br />
                RepaymentAmount:
                <asp:TextBox ID="RepaymentAmountTextBox" runat="server" Text='<%# Bind("RepaymentAmount") %>' />
                <br />
                CreatedDate:
                <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                <br />
                CreatedBy:
                <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            Schedule Date:
                        </td>
                        <td class="style3"><%--OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"--%>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                Width="200px">
                            </asp:DropDownList>
                            
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Repayment Amount:
                        </td>
                        <td>
                            <asp:TextBox ID="RepaymentAmountTextBox" runat="server" Text='<%# Bind("RepaymentAmount") %>'
                                Width="200px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RepaymentAmountTextBox"
                                ErrorMessage="Required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Paid By:
                        </td>
                        <td>
                            <asp:TextBox ID="RepaymentAmountTextBox0" runat="server" Text='<%# Bind("RepaymentBy") %>'
                                Width="200px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RepaymentAmountTextBox0"
                                ErrorMessage="Required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Save" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                RepaymentId:
                <asp:Label ID="RepaymentIdLabel" runat="server" Text='<%# Eval("RepaymentId") %>' />
                <br />
                LoanId:
                <asp:Label ID="LoanIdLabel" runat="server" Text='<%# Bind("LoanId") %>' />
                <br />
                RepaymentAmount:
                <asp:Label ID="RepaymentAmountLabel" runat="server" Text='<%# Bind("RepaymentAmount") %>' />
                <br />
                CreatedDate:
                <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Bind("CreatedDate") %>' />
                <br />
                CreatedBy:
                <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="RepaymentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM [Repayments] WHERE [RepaymentId] = @RepaymentId" InsertCommand="INSERT INTO Repayments(LoanId, RepaymentAmount, Description, RepaymentBy) VALUES (@LoanId, @RepaymentAmount, @Description, @RepaymentBy)"
            SelectCommand="SELECT * FROM [Repayments] WHERE ([LoanId] = @LoanId)" UpdateCommand="UPDATE [Repayments] SET [LoanId] = @LoanId, [RepaymentAmount] = @RepaymentAmount, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [Description] = @Description, [RepaymentBy] = @RepaymentBy WHERE [RepaymentId] = @RepaymentId"
            OnInserted="RepaymentSqlDataSource_Inserted">
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
    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="RepaymentId" DataSourceID="RepaymentSqlDataSource"
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
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
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
    </div>
    </form>
</body>
</html>
