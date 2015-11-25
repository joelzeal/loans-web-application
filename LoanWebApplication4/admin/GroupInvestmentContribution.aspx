<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="GroupInvestmentContribution.aspx.cs" Inherits="LoanWebApplication4.GroupInvestmentContribution" %>

<%@ Register src="../UserControls/PaymentMethodWebUserControl.ascx" tagname="PaymentMethodWebUserControl" tagprefix="uc3" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<%@ Register src="~/UserControls/GroupInvestmentToolBarWebUserControl.ascx" tagname="GroupInvestmentToolBarWebUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 165px;
        }
        
        .style28
        {
            width: 95px;
        }
        .style29
        {
            width: 185px;
        }
        </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("InvestmentDetails").ready(function ($) {
            $('#memberDetails').height($('#InvestmentDetails').height()); /* */
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <h2>
                    Group Contribution<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </h2>
            </td>
            <td align="right">
                <uc1:GroupInvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl13" 
                    runat="server" />
            </td>
        </tr>
    </table>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 49%" valign="top">
                <div class="DataSection" id="memberDetails">
                    <table border="0" cellpadding="0" cellspacing="0" >
                        <tr>
                            <td style="width: 170px">
                                
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
         <asp:SqlDataSource ID="vwGroupsSqlDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
             
                                    SelectCommand="SELECT GroupName, Description, GroupId, GroupMemberCount FROM vwGroups WHERE (GroupId = @GroupId)">
             <SelectParameters>
                 <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
        
                                <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                    SelectCommand="SELECT dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, LoanDurations.Description AS LoanDurationDescription, RepaymentFrequencies.Description AS CointributionFrequencyDescription, InterestRateTypes.Description AS InterestRateTypeDescription, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, vwGroups.GroupName, vwGroups.Description, vwGroups.GroupId, vwGroups.GroupMemberCount, dbo.GetTotalAppliedInterest(Investments.InvestmentID) AS TotalAppliedInterest, dbo.GetBalance(Investments.InvestmentID) AS Balance, dbo.GetTotalAppliedDeduction(Investments.InvestmentID) AS TotalAppliedDeduction FROM Investments INNER JOIN vwGroups ON Investments.GroupId = vwGroups.GroupId LEFT OUTER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId LEFT OUTER JOIN RepaymentFrequencies ON Investments.ContributionFrequencyId = RepaymentFrequencies.RepaymentFrequencyId LEFT OUTER JOIN InterestRateTypes ON Investments.InterestTypeId = InterestRateTypes.InterestRateTypeId WHERE (Investments.InvestmentID = @InvestmentID)"
                                    
                                    
                                    
                                    UpdateCommand="UPDATE Members SET Balance = Balance + @DepositAmount WHERE (MemberId = @MemberId)">
                                    <SelectParameters>
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
                &nbsp;</td>
            <td style="width: 49%" valign="top">
                <div class="DataSection" id="InvestmentDetails">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="InvestmentID" DataSourceID="MemberSqlDataSource1"
                        Width="100%">
                        <ItemTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style29">
                                        Total Contribution:
                                    </td>
                                    <td>
                                        <asp:Label ID="TotalContributionLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalContribution", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Total Withdrawal:</td>
                                    <td>
                                        <asp:Label ID="TotalWithdrawalLabel" runat="server" CssClass="bold" 
                                            Text='<%# Bind("TotalWithdrawal", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Total Applied Interest:</td>
                                    <td>
                                        <asp:Label ID="TotalAppliedInterestLabel" runat="server" CssClass="bold" 
                                            Text='<%# Eval("TotalAppliedInterest", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Total Applied Deductions:</td>
                                    <td>
                                        <asp:Label ID="TotalAppliedDeductionLabel" runat="server" CssClass="bold" 
                                            Text='<%# Eval("TotalAppliedDeduction", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style29">
                                        Outstanding Balance:</td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" CssClass="bold" 
                                            Text='<%# Eval("Balance", "{0:C}") %>' />
                                    </td>
                                </tr>
                             
                            </table>
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
        New Contribution</h3>
    <div class="seperator">
    </div>
    <div class="DataSection">

        <uc3:PaymentMethodWebUserControl ID="PaymentMethodWebUserControl1" 
            runat="server" />

        <table style="width: 100%;">
            
        </table>
    
        <table style="width: 100%;">
                    <tr>
                        <td class="style2">
                            Contribution Amount:
                        </td>
                        <td>
                            <asp:TextBox ID="ContributionAmountTextBox" runat="server" Text='<%# Bind("ContributionAmount") %>'
                                Width="300px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Contribution By:
                        </td>
                        <td>
                            <asp:TextBox ID="ContributionByTextBox" runat="server" Text='<%# Bind("ContributionBy") %>'
                                Width="300px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Contribution Date:</td>
                        <td>
                            <%--<cc1:CalendarExtender ID="ContributionDateTextBox_CalendarExtender" 
                                runat="server" Enabled="True" Format="dd-MM-yyyy" 
                                TargetControlID="ContributionDateTextBox">
                            </cc1:CalendarExtender>--%>
                            <%--<cc1:CalendarExtender ID="ContributionDateTextBox_CalendarExtender" 
                                runat="server" Enabled="True" Format="dd-MM-yyyy" 
                                TargetControlID="ContributionDateTextBox">
                            </cc1:CalendarExtender>--%>
                            <uc2:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Save" onclick="InsertButton_Click" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
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
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete the selected deposit? This action cannot be reversed.');"
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Contribution Date" SortExpression="CreatedDate">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Bind("CreatedDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="ContributionId" HeaderText="ContributionId" SortExpression="ContributionId"
                    InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="InvestmentId" HeaderText="InvestmentId" SortExpression="InvestmentId"
                    Visible="False"></asp:BoundField>

                <asp:BoundField DataField="ContributionAmount" HeaderText="Contribution Amount" 
                    SortExpression="ContributionAmount">
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
            ondeleting="WithdrawalHistorySqlDataSource1_Deleting">
            <DeleteParameters>
                <asp:Parameter Name="ContributionId" Type="Int32" />
                <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
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
