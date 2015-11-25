<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="InvestmentWithdrawal.aspx.cs" Inherits="LoanWebApplication4.InvestmentWithdrawal" %>

    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../UserControls/InvestmentToolBarWebUserControl.ascx" tagname="InvestmentToolBarWebUserControl" tagprefix="uc1" %>

<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style6
        {
            width: 144px;
        }
        .style4
        {
            width: 129px;
        }
    </style>

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $("MainContent_DivRepaymentDetails").ready(function ($) {
            $('#InvestmentDetails').height($('#memberDetails').height()); /* */
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
         <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>   Member Withdrawal 
                <asp:ScriptManager ID="ScriptManager1" runat="server">
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
            <td style="width:49%" valign="top">
            <div class="DataSection" id="memberDetails">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:170px">
                <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2"  runat="server" />
                </td>

                <td valign="top">
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" 
            DataSourceID="MemberSqlDataSource1" Width="569px">
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
        <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT Members.MemberId AS Expr1, Members.MemberFirstName, Members.MemberLastName, Members.MemberPhoto, Members.MemberBranch, Members.ModifiedDate, Members.AccountNumber, Members.OtherName, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, LoanDurations.Description AS LoanDurationDescription, RepaymentFrequencies.Description AS CointributionFrequencyDescription, InterestRateTypes.Description AS InterestRateTypeDescription, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedDeduction(Investments.InvestmentID) AS TotalAppliedDeductions FROM Members INNER JOIN Investments ON Members.MemberId = Investments.MemberID LEFT OUTER JOIN RepaymentFrequencies ON Investments.ContributionFrequencyId = RepaymentFrequencies.RepaymentFrequencyId LEFT OUTER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId LEFT OUTER JOIN InterestRateTypes ON Investments.InterestTypeId = InterestRateTypes.InterestRateTypeId WHERE (Members.MemberId = @MemberId) AND (Investments.InvestmentID = @InvestmentID)" 
            
                        
                        
                        
                        
                        
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
             <td style="width:1%" valign="top">
            </td>
             <td style="width:49%" valign="top">
                <div class="DataSection" id="InvestmentDetails">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="Expr1,InvestmentID" 
                        DataSourceID="MemberSqlDataSource1" Width="100%">
                       
                        <ItemTemplate>
                            Total Contribution:
                            <asp:Label ID="TotalContributionLabel" runat="server" CssClass="bold" 
                                Text='<%# Bind("TotalContribution", "{0:C}") %>' />
                            <br />
                            Total Withdrawal:
                            <asp:Label ID="TotalWithdrawalLabel" runat="server" CssClass="bold" 
                                Text='<%# Bind("TotalWithdrawal", "{0:C}") %>' />
                           <br />
                                Outstanding Balance:
                            <asp:Label ID="Label1" runat="server" CssClass="bold" 
                                
                                Text='<%# ((Decimal)Eval("TotalContribution") - (Decimal)Eval("TotalWithdrawal") - (Decimal)Eval("TotalAppliedDeductions ")).ToString("C") %>' />
                            <br />  
               
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    <br />
                    <br />
                    <br />
                </div>
            </td>
        </tr>
    </table>
    <h3>
        New Withdrawal</h3>
        <div class="seperator"></div>
    <div class="DataSection">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="MemberWithdrawalId" DataSourceID="WithdrawalHistorySqlDataSource1"
            DefaultMode="Insert" Width="598px" 
            oniteminserted="FormView2_ItemInserted1" 
            oniteminserting="FormView2_ItemInserting">
            <EditItemTemplate>
                MemberWithdrawalId:
                <asp:Label ID="MemberWithdrawalIdLabel1" runat="server" Text='<%# Eval("MemberWithdrawalId") %>' />
                <br />
                MemberId:
                <asp:TextBox ID="MemberIdTextBox" runat="server" Text='<%# Bind("MemberId") %>' />
                <br />
                WithdrawalAmount:
                <asp:TextBox ID="WithdrawalAmountTextBox" runat="server" Text='<%# Bind("WithdrawalAmount") %>' />
                <br />
                WithdrawnBy:
                <asp:TextBox ID="WithdrawnByTextBox" runat="server" Text='<%# Bind("WithdrawnBy") %>' />
                <br />
                WithdrawalIssuedByUserId:
                <asp:TextBox ID="WithdrawalIssuedByUserIdTextBox" runat="server" Text='<%# Bind("WithdrawalIssuedByUserId") %>' />
                <br />
                DateCreated:
                <asp:TextBox ID="DateCreatedTextBox" runat="server" Text='<%# Bind("DateCreated") %>' />
                <br />
                CreatedBy:
                <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td class="style4">
                            Amount:
                        </td>
                        <td>
                            <asp:TextBox ID="WithdrawalAmountTextBox0" runat="server" Text='<%# Bind("WithdrawalAmount") %>'
                                Width="300px" OnTextChanged="WithdrawalAmountTextBox_TextChanged" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Withdrawal By:
                        </td>
                        <td>
                            <asp:TextBox ID="WithdrawnByTextBox0" runat="server" Text='<%# Bind("WithdrawnBy") %>'
                                Width="300px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Withdrawal Date:</td>
                        <td>
                            
                           <%-- <asp:TextBox ID="txtWithdrawalDate" runat="server" 
                                Text='<%# Bind("DateCreated", "{0:dd-MM-yyyy}") %>' Width="200px" />
                            <asp:CalendarExtender ID="txtWithdrawalDate_CalendarExtender" runat="server" 
                                Enabled="True" Format="dd-MM-yyyy" TargetControlID="txtWithdrawalDate">
                            </asp:CalendarExtender>--%>
                            <uc2:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4">
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
                MemberWithdrawalId:
                <asp:Label ID="MemberWithdrawalIdLabel" runat="server" Text='<%# Eval("MemberWithdrawalId") %>' />
                <br />
                MemberId:
                <asp:Label ID="MemberIdLabel" runat="server" Text='<%# Bind("MemberId") %>' />
                <br />
                WithdrawalAmount:
                <asp:Label ID="WithdrawalAmountLabel" runat="server" Text='<%# Bind("WithdrawalAmount") %>' />
                <br />
                WithdrawnBy:
                <asp:Label ID="WithdrawnByLabel" runat="server" Text='<%# Bind("WithdrawnBy") %>' />
                <br />
                WithdrawalIssuedByUserId:
                <asp:Label ID="WithdrawalIssuedByUserIdLabel" runat="server" Text='<%# Bind("WithdrawalIssuedByUserId") %>' />
                <br />
                DateCreated:
                <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Bind("DateCreated") %>' />
                <br />
                CreatedBy:
                <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </div>
    <h3>
        withdrawal History</h3>
        <div class="seperator">   </div>
    <div class="DataSection">
        <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="MemberWithdrawalId" DataSourceID="WithdrawalHistorySqlDataSource1"
            ForeColor="#333333" GridLines="None" AllowPaging="True" 
            EmptyDataText="No history data">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
            
 <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
                <asp:BoundField DataField="DateCreated" HeaderText="Date" SortExpression="DateCreated">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="MemberWithdrawalId" HeaderText="MemberWithdrawalId" InsertVisible="False"
                    ReadOnly="True" SortExpression="MemberWithdrawalId" Visible="False" />
                <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId"
                    Visible="False" />
                <asp:BoundField DataField="WithdrawalAmount" HeaderText="Amount" SortExpression="WithdrawalAmount">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="WithdrawnBy" HeaderText="Withdrawal By" SortExpression="WithdrawnBy">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="WithdrawalIssuedByUserId" HeaderText="WithdrawalIssuedByUserId"
                    SortExpression="WithdrawalIssuedByUserId" Visible="False">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy"
                    Visible="False" />
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
        <asp:SqlDataSource ID="WithdrawalHistorySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM [MemberWithdrawals] WHERE [MemberWithdrawalId] = @MemberWithdrawalId"
            InsertCommand="INSERT INTO MemberWithdrawals(MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, Narration, InvestmentID, IsDeleted) VALUES (@MemberId, @WithdrawalAmount, @WithdrawnBy, @WithdrawalIssuedByUserName, GetDate(), @CreatedBy, @Narration, @InvestmentID, 0)"
            SelectCommand="SELECT MemberWithdrawalId, MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, InvestmentID, Narration FROM MemberWithdrawals WHERE (InvestmentID = @InvestmentID)"
            UpdateCommand="UPDATE [MemberWithdrawals] SET [WithdrawalAmount] = @WithdrawalAmount, [WithdrawnBy] = @WithdrawnBy, [WithdrawalIssuedByUserId] = @WithdrawalIssuedByUserId, [DateCreated] = @DateCreated, [CreatedBy] = @CreatedBy WHERE [MemberWithdrawalId] = @MemberWithdrawalId"
            OnInserted="WithdrawalHistorySqlDataSource1_Inserted" 
            ondeleting="item_Deleting" oninserting="item_inserting" 
            onupdating="item_Updating">
            <DeleteParameters>
                <asp:Parameter Name="MemberWithdrawalId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
                <asp:Parameter Name="WithdrawalAmount" Type="Decimal" />
                <asp:Parameter Name="WithdrawnBy" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="CreatedBy" 
                    SessionField="CurrentUser_session" Type="String" />
                <asp:Parameter Name="Narration" DefaultValue="Member withdrawal" />
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
    </div>
</asp:Content>
