<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="GroupLoanRepayment.aspx.cs" Inherits="LoanWebApplication4.admin.GroupLoanRepayment  " %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/LoansToolBarWebUserControl.ascx" TagName="LoansToolBarWebUserControl"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControls/DateWebUserControl.ascx" TagName="DateWebUserControl"
    TagPrefix="uc2" %>
<%@ Register src="../UserControls/GroupLoansToolBarWebUserControl.ascx" tagname="GroupLoansToolBarWebUserControl" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <%--  <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function ($) {
            $('#DivMemberDetails').height($('#DivRepaymentDetails').height()); /* */
        });
    </script>
    <style type="text/css">
        .style28
        {
            width: 95px;
        }
        .style29
        {
            width: 152px;
        }
        .style30
        {
            width: 213px;
        }
        .style31
        {
            width: 217px;
        }
        .style32
        {
            width: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <table width="100%">
        <tr valign="middle">
            <td> <h2>
        Loan Repayment</h2>
            </td>
            <td align="right">
                <uc3:GroupLoansToolBarWebUserControl ID="GroupLoansToolBarWebUserControl1" 
                    runat="server" />
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td>
                <div class="DataSection" id="DivMemberDetails" style="height: 100%">
                    <asp:FormView ID="FormView3" runat="server" DataKeyNames="GroupId" DataSourceID="vwGroupsSqlDataSource"
                        Width="470px">
                        <EditItemTemplate>
                            GroupName:
                            <asp:TextBox ID="GroupNameTextBox" runat="server" Text='<%# Bind("GroupName") %>' />
                            <br />
                            Description:
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                            <br />
                            GroupId:
                            <asp:Label ID="GroupIdLabel1" runat="server" Text='<%# Eval("GroupId") %>' />
                            <br />
                            GroupMemberCount:
                            <asp:TextBox ID="GroupMemberCountTextBox" runat="server" Text='<%# Bind("GroupMemberCount") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            GroupName:
                            <asp:TextBox ID="GroupNameTextBox0" runat="server" Text='<%# Bind("GroupName") %>' />
                            <br />
                            Description:
                            <asp:TextBox ID="DescriptionTextBox0" runat="server" Text='<%# Bind("Description") %>' />
                            <br />
                            GroupId:
                            <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                            <br />
                            GroupMemberCount:
                            <asp:TextBox ID="GroupMemberCountTextBox0" runat="server" Text='<%# Bind("GroupMemberCount") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style28">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "MemberGroupDetails.aspx?GroupId=" + Eval("GroupId") %>'><img alt="" src="../images/Groups.png" class="memberImageBox2" style="height: 80px; width: 105px" /></asp:HyperLink>
                                    </td>
                                    <td>
                                    </td>
                                    <td valign="top">
                                        <strong>Group Name:</strong>
                                        <asp:Label ID="GroupNameLabel" runat="server" Text='<%# Bind("GroupName") %>' />
                                        <br />
                                        <strong>Description</strong>:
                                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                                        <br />
                                        <strong>Number of Members</strong>:
                                        <asp:Label ID="GroupMemberCountLabel" runat="server" Text='<%# Bind("GroupMemberCount") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="vwGroupsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                        SelectCommand="SELECT * FROM [vwGroups] WHERE ([GroupId] = @GroupId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="ScheduleIDHiddenField" runat="server" />
    <h3>
        Repayment Details</h3>
    <div class="DataSection" id="DivNewRepayment">
        <table style="width: 100%;">
            <tr>
                <td class="style29">
                    Schedule Date:
                </td>
                <td class="style4">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtFriend" runat="server" ReadOnly="true" Width="200px" />
                            <asp:SqlDataSource ID="LoanRepaymentScheduleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT RepaymentScheduleId, MemberID, LoanId, RepaymentDate, ExpectedRepaymentAmount, IsPaymentMade, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, Balance FROM RepaymentSchedule WHERE (LoanId = @loanID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="loanID" QueryStringField="lid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Panel ID="FriendDropDown" runat="server" Style="max-height: 150px; overflow: auto;
                                border: 1px solid red" Width="473px">
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
                <td class="style29">
                    Repayment Amount:
                </td>
                <td class="style4">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style30">
                                <asp:TextBox ID="RepaymentAmountTextBox" runat="server" Text='<%# Bind("RepaymentAmount") %>'
                                    Width="200px" ValidationGroup="g1" />
                            </td>
                            <td class="style32">
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/notes.gif" Width="22px"
                                    OnClick="ImageButton2_Click" ToolTip="Pay with an investment" ValidationGroup="g2" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RepaymentAmountTextBox"
                                    ErrorMessage="Repayment Required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style29">
                    Repayment Date:
                </td>
                <td class="style4">
                    &nbsp;<uc2:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style29">
                    Paid By:
                </td>
                <td class="style4">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style31">
                                <asp:TextBox ID="PaidTextBox" runat="server" Text='<%# Bind("RepaymentBy") %>' Width="200px"
                                    ValidationGroup="g1" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PaidTextBox"
                                    ErrorMessage="Paid by is required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style29">
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
            DeleteCommand="UPDATE Repayments SET isDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (RepaymentId = @RepaymentId)"
            InsertCommand="INSERT INTO Repayments(LoanId, RepaymentAmount, Description, RepaymentBy) VALUES (@LoanId, @RepaymentAmount, @Description, @RepaymentBy)"
            SelectCommand="SELECT RepaymentId, LoanId, RepaymentAmount, CreatedDate, CreatedBy, Description, RepaymentBy, RepaymentScheduleID, RepaidWithInvestmentID, ReceiptNumber, RepaymentAmountInWords, InterestPayment, PrincipalPayment, isDeleted FROM Repayments WHERE (LoanId = @LoanId) AND (isDeleted &lt;&gt; 1)"
            UpdateCommand="UPDATE [Repayments] SET [LoanId] = @LoanId, [RepaymentAmount] = @RepaymentAmount, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [Description] = @Description, [RepaymentBy] = @RepaymentBy WHERE [RepaymentId] = @RepaymentId"
            OnInserted="RepaymentSqlDataSource_Inserted" OnDeleting="item_Deleting" OnUpdating="item_Updating">
            <DeleteParameters>
                <asp:Parameter Name="RepaymentId" Type="Int32" />
                <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
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
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete the selected loan repayment? This action cannot be reversed.');"
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
