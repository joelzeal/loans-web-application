<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="GroupInvestmentWithdrawal.aspx.cs" Inherits="LoanWebApplication4.GroupInvestmentWithdrawal" %>

<%@ Register src="~/UserControls/GroupInvestmentToolBarWebUserControl.ascx" tagname="GroupInvestmentToolBarWebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 113px;
        }
                
        .style28
        {
            width: 95px;
        }
        </style>

    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $("MainContent_DivRepaymentDetails").ready(function ($) {
            $('#memberDetails').height($('#InvestmentDetails').height()); /* */
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
         <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>   Group Withdrawal </h2>
            </td>
             <td align="right">
                 <uc1:GroupInvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl12" 
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
        <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId AS Expr1, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, LoanDurations.Description AS LoanDurationDescription, RepaymentFrequencies.Description AS CointributionFrequencyDescription, InterestRateTypes.Description AS InterestRateTypeDescription, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, vwGroups.* FROM Investments INNER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId INNER JOIN RepaymentFrequencies ON Investments.ContributionFrequencyId = RepaymentFrequencies.RepaymentFrequencyId INNER JOIN InterestRateTypes ON Investments.InterestTypeId = InterestRateTypes.InterestRateTypeId INNER JOIN vwGroups ON Investments.GroupId = vwGroups.GroupId WHERE (Investments.InvestmentID = @InvestmentID)" 
            
                        
                        
                        
                        
                        UpdateCommand="UPDATE Members SET Balance = Balance + @DepositAmount WHERE (MemberId = @MemberId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="InvestmentID" QueryStringField="InvId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DepositAmount" />
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" />
            </UpdateParameters>
        </asp:SqlDataSource>
                                
         <asp:FormView ID="FormView4" runat="server" DataKeyNames="GroupId" 
             DataSourceID="MemberSqlDataSource1" Width="470px">
             <EditItemTemplate>
                 GroupName:
                 <asp:TextBox ID="GroupNameTextBox" runat="server" 
                     Text='<%# Bind("GroupName") %>' />
                 <br />
                 Description:
                 <asp:TextBox ID="DescriptionTextBox" runat="server" 
                     Text='<%# Bind("Description") %>' />
                 <br />
                 GroupId:
                 <asp:Label ID="GroupIdLabel1" runat="server" Text='<%# Eval("GroupId") %>' />
                 <br />
                 GroupMemberCount:
                 <asp:TextBox ID="GroupMemberCountTextBox" runat="server" 
                     Text='<%# Bind("GroupMemberCount") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                     CommandName="Update" Text="Update" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                     CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </EditItemTemplate>
             <InsertItemTemplate>
                 GroupName:
                 <asp:TextBox ID="GroupNameTextBox0" runat="server" 
                     Text='<%# Bind("GroupName") %>' />
                 <br />
                 Description:
                 <asp:TextBox ID="DescriptionTextBox0" runat="server" 
                     Text='<%# Bind("Description") %>' />
                 <br />
                 GroupId:
                 <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                 <br />
                 GroupMemberCount:
                 <asp:TextBox ID="GroupMemberCountTextBox0" runat="server" 
                     Text='<%# Bind("GroupMemberCount") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                     CommandName="Insert" Text="Insert" />
                 &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                     CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </InsertItemTemplate>
             <ItemTemplate>
                 <table style="width:100%;">
                     <tr>
                         <td class="style28">
                             <asp:HyperLink ID="HyperLink1" runat="server" 
                                 NavigateUrl='<%# "MemberGroupDetails.aspx?GroupId=" + Eval("GroupId") %>'><img alt="" src="../images/Groups.png" class="memberImageBox2" style="height: 80px; width: 105px" /></asp:HyperLink>
                        
                            
                         </td>
                         <td>
                         </td>
                         <td valign="top">
                             <strong>Group Name:</strong>
                             <asp:Label ID="GroupNameLabel" runat="server" Text='<%# Bind("GroupName") %>' />
                             <br />
                             <strong>Description</strong>:
                             <asp:Label ID="DescriptionLabel" runat="server" 
                                 Text='<%# Bind("Description") %>' />
                             <br />
                             <strong>Number of Members</strong>:
                             <asp:Label ID="GroupMemberCountLabel" runat="server" 
                                 Text='<%# Bind("GroupMemberCount") %>' />
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
                            <asp:Label ID="Label1" runat="server" CssClass="bold" Text='<%# (Decimal)Eval("TotalContribution") - (Decimal)Eval("TotalWithdrawal") %>' />
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
            DefaultMode="Insert" Width="552px" oniteminserted="FormView2_ItemInserted">
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
                            <asp:TextBox ID="WithdrawalAmountTextBox" runat="server" Text='<%# Bind("WithdrawalAmount") %>'
                                Width="200px" OnTextChanged="WithdrawalAmountTextBox_TextChanged" />
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
                            <asp:TextBox ID="WithdrawnByTextBox" runat="server" Text='<%# Bind("WithdrawnBy") %>'
                                Width="200px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
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
            ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete the selected payment? This action cannot be reversed.');"
                        Text="Delete" />
                </ItemTemplate>
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
            DeleteCommand="UPDATE MemberWithdrawals SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (MemberWithdrawalId = @MemberWithdrawalId)"
            InsertCommand="INSERT INTO MemberWithdrawals(MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, Narration, InvestmentID, IsDeleted) VALUES (@MemberId, @WithdrawalAmount, @WithdrawnBy, @WithdrawalIssuedByUserName, GETDATE(), @CreatedBy, @Narration, @InvestmentID, 0)"
            SelectCommand="SELECT MemberWithdrawalId, MemberId, WithdrawalAmount, WithdrawnBy, WithdrawalIssuedByUserName, DateCreated, CreatedBy, InvestmentID, Narration, IsDeleted FROM MemberWithdrawals WHERE (InvestmentID = @InvestmentID) AND (IsDeleted &lt;&gt; 1)"
            UpdateCommand="UPDATE [MemberWithdrawals] SET [WithdrawalAmount] = @WithdrawalAmount, [WithdrawnBy] = @WithdrawnBy, [WithdrawalIssuedByUserId] = @WithdrawalIssuedByUserId, [DateCreated] = @DateCreated, [CreatedBy] = @CreatedBy WHERE [MemberWithdrawalId] = @MemberWithdrawalId"
            OnInserted="WithdrawalHistorySqlDataSource1_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="MemberWithdrawalId" Type="Int32" />
                <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
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
    </div>
</asp:Content>
