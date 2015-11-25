<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="GroupLoansLoans.aspx.cs" Inherits="LoanWebApplication4.admin.GroupLoansLoans" %>
<%@ Register src="../UserControls/GroupToolBarWebUserControl.ascx" tagname="GroupToolBarWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style28
        {
            width: 95px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>Group Loans</h2>
            </td>
            <td align="right">
                
                <uc1:GroupToolBarWebUserControl ID="GroupToolBarWebUserControl1" 
                    runat="server" />
                
            </td>
        </tr>
    </table>
    <br />
    <div class="DataSection">
        
         <asp:FormView ID="FormView2" runat="server" DataKeyNames="GroupId" 
             DataSourceID="vwGroupsSqlDataSource" Width="470px">
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
             SelectCommand="SELECT * FROM [vwGroups] WHERE ([GroupId] = @GroupId)">
             <SelectParameters>
                 <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
        
    </div>
    <br />
       <div class="headerBacground">
        <table width="100%">
            <tr >
                <td>
                    
                        <strong>Group Loans
                </strong>
                </td>
                <td align="right">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/addNew.png" Width="32px" ToolTip="New Group Loan"
                        runat="server" onclick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator" />
    <asp:GridView width="100%" ID="GridView1" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LoanID" 
        DataSourceID="LoansSqlDataSource" ForeColor="#333333" GridLines="None" 
        EmptyDataText="No loans associated with this group">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
        
   <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
         <asp:HyperLinkField DataNavigateUrlFields="LoanID,GroupID" DataNavigateUrlFormatString="~/admin/NewLoan_MemberPreSelected.aspx?lId={0}&gid={1}"
                NavigateUrl="~/admin/NewLoan_MemberPreSelected.aspx" Text="Edit">
                <HeaderStyle Width="50px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LoanID,GroupId" 
                DataNavigateUrlFormatString="~/admin/GroupLoanRepayment.aspx?lid={0}&amp;gid={1}" 
                NavigateUrl="~/admin/GroupLoanRepayment.aspx" Text="Repayment" />
            <asp:BoundField DataField="Principal" HeaderText="Principal" 
                SortExpression="Principal" DataFormatString="{0:c}">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" 
                DataFormatString="{0:c}" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Interest" HeaderText="Interest" 
                SortExpression="Interest">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Interest Type" SortExpression="InterestTypeId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InterestTypeId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Utils.InterestTypeName((int)Eval("InterestTypeId")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" 
                ReadOnly="True" SortExpression="LoanID" Visible="False" />
            <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                SortExpression="MemberId" Visible="False" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                SortExpression="Duration">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="payWithContribution" 
                HeaderText="payWithContribution" SortExpression="payWithContribution" 
                Visible="False" />
            <asp:TemplateField HeaderText="Repayment Frequency" 
                SortExpression="RepaymentFrequencyId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("RepaymentFrequencyId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Utils.RepaymentFreqName((int)Eval("RepaymentFrequencyId")) %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan Date" SortExpression="CreatedDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("CreatedDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Expected Repayment Date" 
                SortExpression="ExpectedRepaymentEndDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("ExpectedRepaymentEndDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("ExpectedRepaymentEndDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Actual Repayment End Date" 
                SortExpression="ActualRepaymentEndDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("ActualRepaymentEndDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Bind("ActualRepaymentEndDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsPaidup" HeaderText="Is Paid up" 
                SortExpression="IsPaidup">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CheckBoxField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        CommandArgument='<%# Eval("LoanID") %>' ImageUrl="~/images/printStatement.png" gid='<%# Eval("GroupID") %>'
                        onclick="ImageButton2_Click" ToolTip="Print Loan Statement" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton3" runat="server" gid='<%# Eval("GroupID") %>'
                        CommandArgument='<%# Eval("LoanID") %>' ImageUrl="~/images/printSchedule.png" 
                        onclick="ImageButton3_Click" ToolTip="Print Loan Schedule" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="LoansSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        
            SelectCommand="SELECT LoanID, MemberId, Interest, InterestTypeId, Principal, Amount, Duration, payWithContribution, RepaymentFrequencyId, CreatedDate, ExpectedRepaymentEndDate, ActualRepaymentEndDate, IsPaidup, Balance, RepaymentFreqAmount, DurationType, RawDurationEntered, LoanCalculationStartDate, CollateralID, CollateralDescription, GuarantorID, GroupID FROM Loans WHERE (GroupID = @GroupId) AND (IsDeleted &lt;&gt; 1) ORDER BY CreatedDate DESC" 
            
            DeleteCommand="UPDATE Loans SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (LoanID = @LoanID)" 
            ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            <asp:Parameter Name="LoanID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
