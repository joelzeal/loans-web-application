<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="MemberLoans.aspx.cs" Inherits="LoanWebApplication4.admin.MemberLoans" %>

<%@ Register src="../UserControls/MemberToolBarWebUserControl.ascx" tagname="MemberToolBarWebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <h2>
                    Member Loans</h2>
            </td>
            <td align="right">
                <uc1:MemberToolBarWebUserControl ID="MemberToolBarWebUserControl1" 
                    runat="server" />
            </td>
        </tr>
    </table>
    <div class="DataSection">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 170px">
                    <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2" runat="server" />
                </td>
                <td style="width: 170px">
                    <asp:Image ID="SignatureImage" Width="135px" CssClass="memberImageBox2" 
                        runat="server" />
                </td>
                <td style="width: 170px">
                    <asp:Image ID="IDCardImage" Width="135px" CssClass="memberImageBox2" 
                        runat="server" />
                </td>
                <td valign="top">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" DataSourceID="MemberSqlDataSource1"
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
                                    <td class="style1">
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
                                    <td class="style1">
                                        <b>Last Name:</b>
                                    </td>
                                    <td>
                                        <asp:Label ID="MemberLastNameLabel" runat="server" Text='<%# Bind("MemberLastName") %>' />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <b>Branch:</b>
                                    </td>
                                    <td>
                                        <asp:Label ID="MemberBranchLabel" runat="server" 
                                            Text='<%# Bind("BranchName") %>' />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
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
                        
                        SelectCommand="SELECT Members.MemberId, Members.MemberFirstName, Members.MemberLastName, Members.MemberPhoto, Members.Balance, Members.MemberBranch, Members.CreatedBy, Members.CreatedDate, Members.ModifiedBy, Members.ModifiedDate, Members.AccountNumber, Members.CurrentLoanId, Members.Fax, Members.Telephone, Members.Address, Members.ResidentialAddress, Members.BusinessAddress, Members.Gender, Members.OtherName, Members.ContactPerson, Members.IdentityTypeID, Members.IdentityNumber, Members.DOB, Members.Mobile, Members.IsDeleted, Members.Signature, Members.IDPhoto, Members.OccupationID, Members.ContactPersonPhone, Members.NextOfKin, Members.NextOfKinTelephone, Members.AccountTypeID, Members.BranchID, Branches.BranchID AS Expr1, Branches.BranchName, Branches.BranchCode, Branches.BranchName AS Expr2 FROM Members INNER JOIN Branches ON Members.BranchID = Branches.BranchID WHERE (Members.MemberId = @MemberId)" 
                        UpdateCommand="UPDATE Members SET Balance = Balance - @WithdrawalAmount WHERE (MemberId = @MemberId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="WithdrawalAmount" />
                            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
     <div class="headerBacground">
        <table width="100%">
            <tr >
                <td>
                    
                        <strong>Loans
                </strong>
                </td>
                <td align="right">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/addNew.png" Width="32px" ToolTip="New Loan"
                        runat="server" onclick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator" />
    <asp:GridView width="100%" ID="GridView1" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LoanID" 
        DataSourceID="LoansSqlDataSource" ForeColor="#333333" GridLines="None" 
        EmptyDataText="No loans associated with the current member.">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
         <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>

         <asp:HyperLinkField DataNavigateUrlFields="LoanID,MemberId" DataNavigateUrlFormatString="~/admin/NewLoan_MemberPreSelected.aspx?lId={0}&mid={1}"
                NavigateUrl="~/admin/NewLoan_MemberPreSelected.aspx" Text="Edit">
                <HeaderStyle Width="50px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="LoanID,MemberId" 
                DataNavigateUrlFormatString="~/admin/LoanRepayment.aspx?lid={0}&amp;mid={1}" 
                NavigateUrl="~/admin/LoanRepayment.aspx" Text="Repayment" />
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
                    <asp:ImageButton ID="ImageButton2" runat="server" mid='<%# Eval("MemberId") %>'
                        CommandArgument='<%# Eval("LoanID") %>' ImageUrl="~/images/printStatement.png" 
                        ToolTip="Print loan statement" onclick="ImageButton2_Click" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton3" runat="server" mid='<%# Eval("MemberId") %>'
                        CommandArgument='<%# Eval("LoanID") %>' ImageUrl="~/images/printSchedule.png" 
                        ToolTip="Print loan schedule" onclick="ImageButton3_Click" />
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
        
            SelectCommand="SELECT * FROM Loans WHERE (MemberId = @MemberId) ORDER BY CreatedDate DESC" 
            DeleteCommand="delete from Loans  WHERE (LoanID = @LoanID)" 
            ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            <asp:Parameter Name="LoanID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
