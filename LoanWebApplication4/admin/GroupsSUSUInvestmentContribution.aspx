<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="GroupsSUSUInvestmentContribution.aspx.cs" Inherits="LoanWebApplication4.GroupsSUSUInvestmentContribution" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/GroupInvestmentToolBarWebUserControl.ascx" TagName="GroupInvestmentToolBarWebUserControl"
    TagPrefix="uc1" %>
<%@ Register src="../UserControls/PaymentMethodWebUserControl.ascx" tagname="PaymentMethodWebUserControl" tagprefix="uc2" %>
<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
                

        .style28
        {
            width: 95px;
        }
        .style4
        {
            width: 167px;
        }
        </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("memberDetails").ready(function ($) {
            $('#InvestmentDetails').height($('#memberDetails').height()); /* */
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <h2>
                    Group SUSU Contribution<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </h2>
            </td>
            <td align="right">
                <uc1:GroupInvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl12" 
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
                            <td valign="top">
        
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
                                <asp:SqlDataSource ID="MemberSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                    SelectCommand="SELECT dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, vwGroups.* FROM Investments INNER JOIN vwGroups ON Investments.GroupId = vwGroups.GroupId WHERE (Investments.InvestmentID = @InvestmentID)"
                                    
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
            </td>
            <td style="width: 49%" valign="top">
                <div class="DataSection" id="InvestmentDetails">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="InvestmentID" DataSourceID="MemberSqlDataSource1"
                        Width="100%">
                        <EditItemTemplate>
                            
                            MemberFirstName:
                            <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Text='<%# Bind("MemberFirstName") %>' />
                            <br />
                            MemberLastName:
                            <asp:TextBox ID="MemberLastNameTextBox" runat="server" Text='<%# Bind("MemberLastName") %>' />
                            <br />
                            MemberPhoto:
                            <asp:TextBox ID="MemberPhotoTextBox" runat="server" Text='<%# Bind("MemberPhoto") %>' />
                            <br />
                            MemberBranch:
                            <asp:TextBox ID="MemberBranchTextBox" runat="server" Text='<%# Bind("MemberBranch") %>' />
                            <br />
                            ModifiedDate:
                            <asp:TextBox ID="ModifiedDateTextBox" runat="server" Text='<%# Bind("ModifiedDate") %>' />
                            <br />
                            AccountNumber:
                            <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                            <br />
                            OtherName:
                            <asp:TextBox ID="OtherNameTextBox" runat="server" Text='<%# Bind("OtherName") %>' />
                            <br />
                            TotalContribution:
                            <asp:TextBox ID="TotalContributionTextBox" runat="server" Text='<%# Bind("TotalContribution") %>' />
                            <br />
                            InvestmentID:
                            <asp:Label ID="InvestmentIDLabel1" runat="server" Text='<%# Eval("InvestmentID") %>' />
                            <br />
                            MemberID:
                            <asp:TextBox ID="MemberIDTextBox" runat="server" Text='<%# Bind("MemberID") %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            CreatedBy:
                            <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                            <br />
                            InsterstRate:
                            <asp:TextBox ID="InsterstRateTextBox" runat="server" Text='<%# Bind("InsterstRate") %>' />
                            <br />
                            InvestmentAmount:
                            <asp:TextBox ID="InvestmentAmountTextBox" runat="server" Text='<%# Bind("InvestmentAmount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                            <br />
                            Balance:
                            <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                            <br />
                            GroupId:
                            <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                            <br />
                            ContributionFrequencyId:
                            <asp:TextBox ID="ContributionFrequencyIdTextBox" runat="server" Text='<%# Bind("ContributionFrequencyId") %>' />
                            <br />
                            InterestTypeId:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" Text='<%# Bind("InterestTypeId") %>' />
                            <br />
                            MaturityDate:
                            <asp:TextBox ID="MaturityDateTextBox" runat="server" Text='<%# Bind("MaturityDate") %>' />
                            <br />
                            ContributionFreqAmount:
                            <asp:TextBox ID="ContributionFreqAmountTextBox" runat="server" Text='<%# Bind("ContributionFreqAmount") %>' />
                            <br />
                            InvestmentCalculationStartDate:
                            <asp:TextBox ID="InvestmentCalculationStartDateTextBox" runat="server" Text='<%# Bind("InvestmentCalculationStartDate") %>' />
                            <br />
                            IsMatured:
                            <asp:CheckBox ID="IsMaturedCheckBox" runat="server" Checked='<%# Bind("IsMatured") %>' />
                            <br />
                            DurationTypeId:
                            <asp:TextBox ID="DurationTypeIdTextBox" runat="server" Text='<%# Bind("DurationTypeId") %>' />
                            <br />
                            MaturedAmount:
                            <asp:TextBox ID="MaturedAmountTextBox" runat="server" Text='<%# Bind("MaturedAmount") %>' />
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
                            MemberBranch:
                            <asp:TextBox ID="MemberBranchTextBox" runat="server" Text='<%# Bind("MemberBranch") %>' />
                            <br />
                            ModifiedDate:
                            <asp:TextBox ID="ModifiedDateTextBox" runat="server" Text='<%# Bind("ModifiedDate") %>' />
                            <br />
                            AccountNumber:
                            <asp:TextBox ID="AccountNumberTextBox" runat="server" Text='<%# Bind("AccountNumber") %>' />
                            <br />
                            OtherName:
                            <asp:TextBox ID="OtherNameTextBox" runat="server" Text='<%# Bind("OtherName") %>' />
                            <br />
                            TotalContribution:
                            <asp:TextBox ID="TotalContributionTextBox" runat="server" Text='<%# Bind("TotalContribution") %>' />
                            <br />
                            MemberID:
                            <asp:TextBox ID="MemberIDTextBox" runat="server" Text='<%# Bind("MemberID") %>' />
                            <br />
                            CreatedDate:
                            <asp:TextBox ID="CreatedDateTextBox" runat="server" Text='<%# Bind("CreatedDate") %>' />
                            <br />
                            CreatedBy:
                            <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                            <br />
                            InsterstRate:
                            <asp:TextBox ID="InsterstRateTextBox" runat="server" Text='<%# Bind("InsterstRate") %>' />
                            <br />
                            InvestmentAmount:
                            <asp:TextBox ID="InvestmentAmountTextBox" runat="server" Text='<%# Bind("InvestmentAmount") %>' />
                            <br />
                            Duration:
                            <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                            <br />
                            Balance:
                            <asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' />
                            <br />
                            GroupId:
                            <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                            <br />
                            ContributionFrequencyId:
                            <asp:TextBox ID="ContributionFrequencyIdTextBox" runat="server" Text='<%# Bind("ContributionFrequencyId") %>' />
                            <br />
                            InterestTypeId:
                            <asp:TextBox ID="InterestTypeIdTextBox" runat="server" Text='<%# Bind("InterestTypeId") %>' />
                            <br />
                            MaturityDate:
                            <asp:TextBox ID="MaturityDateTextBox" runat="server" Text='<%# Bind("MaturityDate") %>' />
                            <br />
                            ContributionFreqAmount:
                            <asp:TextBox ID="ContributionFreqAmountTextBox" runat="server" Text='<%# Bind("ContributionFreqAmount") %>' />
                            <br />
                            InvestmentCalculationStartDate:
                            <asp:TextBox ID="InvestmentCalculationStartDateTextBox" runat="server" Text='<%# Bind("InvestmentCalculationStartDate") %>' />
                            <br />
                            IsMatured:
                            <asp:CheckBox ID="IsMaturedCheckBox" runat="server" Checked='<%# Bind("IsMatured") %>' />
                            <br />
                            DurationTypeId:
                            <asp:TextBox ID="DurationTypeIdTextBox" runat="server" Text='<%# Bind("DurationTypeId") %>' />
                            <br />
                            MaturedAmount:
                            <asp:TextBox ID="MaturedAmountTextBox" runat="server" Text='<%# Bind("MaturedAmount") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Total Contribution:
                            <asp:Label ID="TotalContributionLabel" runat="server" CssClass="bold" Text='<%# Bind("TotalContribution", "{0:C}") %>' />
                            <br />
                            Total Withdrawal:&nbsp;&nbsp;
                            <asp:Label ID="TotalWithdrawalLabel" runat="server" CssClass="bold" Text='<%# Bind("TotalWithdrawal", "{0:C}") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </td>
        </tr>
    </table>
    <div style="clear:both"></div>
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
                            <asp:TextBox ID="ContributionAmountTextBox" runat="server" Text='<%# Bind("ContributionAmount") %>'
                                Width="300px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="ContributionAmountTextBox" ErrorMessage="*" ForeColor="Red" 
                                ToolTip="Contributon amount is required" ValidationGroup="g5"></asp:RequiredFieldValidator>
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
                            <asp:TextBox ID="ContributionByTextBox" runat="server" Text='<%# Bind("ContributionBy") %>'
                                Width="300px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="ContributionByTextBox" ErrorMessage="*" ForeColor="Red" 
                                ToolTip="Contributon by is required" ValidationGroup="g5"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Contribution&nbsp; Date:</td>
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
        SUSU Contribution History</h3>
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
            DeleteCommand="UPDATE Contributions SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (ContributionId = @ContributionId)"
            InsertCommand="INSERT INTO Contributions(InvestmentId, ContributionAmount, Description, ContributionBy, RecievedBy) VALUES (@InvestmentId, @ContributionAmount, @Description, @ContributionBy, @RecievedBy)"
            SelectCommand="SELECT * FROM [Contributions] WHERE ([InvestmentId] = @InvestmentId)"
            UpdateCommand="UPDATE [Contributions] SET [InvestmentId] = @InvestmentId, [ContributionAmount] = @ContributionAmount, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [Description] = @Description, [ContributionBy] = @ContributionBy, [RecievedBy] = @RecievedBy WHERE [ContributionId] = @ContributionId"
            OnInserted="WithdrawalHistorySqlDataSource1_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="ContributionId" Type="Int32" />
                <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            </DeleteParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="InvestmentId" QueryStringField="InvId" Type="Int32" />
                <asp:Parameter Name="ContributionAmount" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="ContributionBy" />
                <asp:SessionParameter Name="RecievedBy" SessionField="CurrentUser_session" />
                <asp:Parameter Name="ContributionScheduleID" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="InvestmentId" QueryStringField="InvId" Type="Int32" />
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
