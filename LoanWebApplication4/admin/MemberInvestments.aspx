<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="MemberInvestments.aspx.cs" Inherits="LoanWebApplication4.admin.MemberInvestments" %>

<%@ Register Src="../UserControls/MemberToolBarWebUserControl.ascx" TagName="MemberToolBarWebUserControl"
    TagPrefix="uc1" %>
<%@ Register src="../UserControls/MemberToolBarWebUserControl_Investment.ascx" tagname="MemberToolBarWebUserControl_Investment" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <h2>
                    Member Investments</h2>
            </td>
            <td align="right">
                <%--<uc1:MemberToolBarWebUserControl ID="MemberToolBarWebUserControl1" runat="server" />--%>
                <uc2:MemberToolBarWebUserControl_Investment ID="MemberToolBarWebUserControl_Investment1" 
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
                    <asp:Image ID="SignatureImage" Width="135px" CssClass="memberImageBox2" runat="server" />
                </td>
                <td style="width: 170px">
                    <asp:Image ID="IDCardImage" Width="135px" CssClass="memberImageBox2" runat="server" />
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
                                        <asp:Label ID="MemberFirstNameLabel" runat="server" 
                                            Text='<%# Bind("MemberFirstName") %>' CssClass="bold" />
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
                                        <asp:Label ID="MemberLastNameLabel" runat="server" 
                                            Text='<%# Bind("MemberLastName") %>' CssClass="bold" />
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
                                            Text='<%# Bind("BranchName") %>' CssClass="bold" />
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
                                        <asp:Label ID="AccountNumberLabel" runat="server" 
                                            Text='<%# Bind("AccountNumber") %>' CssClass="bold" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
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
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:Panel runat="server" ID="regularInvestmentPanel">
     <div class="headerBacground">
        <table width="100%">
            <tr>
                <td>
                    <strong>
                        <asp:Label  runat="server" ID="lblAccountHeader" /></strong>
                </td>
                <td align="right">
                   <%-- <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/addNew.png" Width="32px" ToolTip="New Regular Investment"
                        runat="server" OnClick="ImageButton1_Click" />--%>
                    <asp:ImageButton ID="btnAddRegularAcountInvestment" runat="server" 
                        ImageUrl="~/images/addNew.png"  
                        ToolTip="New Regular Investment" Width="32px" 
                        onclick="btnAddRegularAcountInvestment_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator">
    </div>
    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="InvestmentID" DataSourceID="RegularInvestmentsSqlDataSource"
        ForeColor="#333333" GridLines="None" 
            EmptyDataText="No investment associated with the current member." 
            ondatabound="GridView1_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
      

      
           <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
            <%-- <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/NewInvestment_MemberPreSelected.aspx?InvId={0}&mid={1}"
                NavigateUrl="~/admin/NewInvestment_MemberPreSelected.aspx" Text="Edit">
                <HeaderStyle Width="50px" />
            </asp:HyperLinkField>--%>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/InvestmentContribution.aspx?InvId={0}&amp;mid={1}"
                NavigateUrl="~/admin/InvestmentContribution.aspx" Text="Contribution">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/InvestmentWithdrawal.aspx?InvId={0}&amp;mid={1}"
                NavigateUrl="~/admin/InvestmentWithdrawal.aspx" Text="Withdrawal">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>

               
            <asp:BoundField DataField="InvestmentAmount" HeaderText="Investment Amount" 
                SortExpression="InvestmentAmount" Visible="False">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="InsterstRate" HeaderText="Insterst Rate" 
                SortExpression="InsterstRate" Visible="False">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="MaturedAmount" HeaderText="Matured Amount" 
                SortExpression="MaturedAmount" Visible="False">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Duration" SortExpression="Duration" 
                Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("DurationDescription") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:BoundField DataField="TotalContribution" HeaderText="Total Contribution" 
                SortExpression="TotalContribution">

            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalWithdrawal" HeaderText="Total Withdrawal" 
                SortExpression="TotalWithdrawal">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>


             <asp:BoundField DataField="TotalAppliedInterest" DataFormatString="{0:C}" 
                HeaderText="Total Applied Interest" SortExpression="TotalAppliedInterest">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalAppliedDeduction" DataFormatString="{0:C}" 
                HeaderText="Total Applied Deduction" SortExpression="TotalAppliedDeduction">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Oustanding Balance">
               
                <ItemTemplate>
                    <asp:Label ID="Label43" runat="server" Text='<%# Eval("Balance1") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MaturityDate" SortExpression="MaturityDate" 
                Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MaturityDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaturityDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Is Matured" Visible="False">
                <ItemTemplate>
                    <asp:Image ID="Image1" Width="22px" Height="22px" ImageUrl='<%# Utils.GetIsMaturedStatusImage(Eval("MaturityDate")) %>'
                        runat="server" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>

         <%--   <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/printStatement.png" runat="server" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
            </asp:TemplateField>--%>
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
    </asp:Panel>
   

    <br />
    <asp:Panel runat="server" ID="SusuInvestmentPanel" Visible="False">
          <div class="headerBacground">
        <table width="100%">
            <tr>
                <td>
                    <strong>
                        <asp:Label  runat="server" ID="lblAccountHeader1" /> </strong>
                </td>
                <td align="right">
                    <%--<asp:ImageButton ID="ImageButton5" ImageUrl="~/images/addNew.png" Width="32px" ToolTip="New SUSU Investment"
                        runat="server" OnClick="ImageButton5_Click" />--%>
                    <asp:ImageButton ID="btnAddSUSUAcountInvestment" runat="server" 
                        ImageUrl="~/images/addNew.png" ToolTip="New SUSU Investment" Width="32px" 
                        onclick="btnAddSUSUAcountInvestment_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator">
    </div>
    <asp:GridView Width="100%" ID="SUSUGridView" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="InvestmentID" DataSourceID="SUSUSqlDataSource"
        ForeColor="#333333" GridLines="None" 
              EmptyDataText="No SUSU investment associated with the current member." 
              ondatabound="SUSUGridView_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
          <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField> <%-- --%>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/SUSUInvestmentContribution.aspx?InvId={0}&amp;mid={1}"
                NavigateUrl="~/admin/SUSUInvestmentContribution.aspx" Text="Contribution">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/SUSUInvestmentWithdrawal.aspx?InvId={0}&amp;mid={1}"
                NavigateUrl="~/admin/SUSUInvestmentWithdrawal.aspx" Text="Withdrawal">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="TotalContribution" HeaderText="Total Contribution" 
                SortExpression="TotalContribution">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalWithdrawal" HeaderText="Total Withdrawal" 
                SortExpression="TotalWithdrawal">
                <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>

             <asp:BoundField DataField="TotalAppliedInterest" DataFormatString="{0:C}" 
                HeaderText="Total Applied Interest" SortExpression="TotalAppliedInterest">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalAppliedDeduction" DataFormatString="{0:C}" 
                HeaderText="Total Applied Deduction" SortExpression="TotalAppliedDeduction">
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="Oustanding Balance">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("balance") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
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

    </asp:Panel>
  
    <br />
    <div class="headerBacground">
        <table width="100%">
            <tr>
                <td>
                    <strong>Fixed Deposit Investments </strong>
                </td>
                <td align="right">
                    <asp:ImageButton ID="ImageButton2" ImageUrl="~/images/addNew.png" Width="32px" ToolTip="New Fixed Deposit Investment"
                        runat="server" OnClick="ImageButton2_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator">
    </div>
    <asp:GridView Width="100%" ID="GridView2" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="InvestmentID" DataSourceID="FixedDepositSqlDataSource"
        ForeColor="#333333" GridLines="None" EmptyDataText="No fixed deposit investment associated with the current member.">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
        
   <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/NewInvestment_FixedDeposit_MemberPreSelected.aspx?InvId={0}&mid={1}"
                NavigateUrl="~/admin/NewInvestment_FixedDeposit_MemberPreSelected.aspx" Text="Edit">
                <HeaderStyle Width="50px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/FixedDepositInvestmentWithdrawal.aspx?InvId={0}&amp;mid={1}"
                NavigateUrl="~/admin/FixedDepositInvestmentWithdrawal.aspx" Text="Withdrawal">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="InvestmentAmount" HeaderText="Investment Amount" SortExpression="InvestmentAmount">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="InsterstRate" HeaderText="Insterst Rate" SortExpression="InsterstRate">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="MaturedAmount" HeaderText="Matured Amount" SortExpression="MaturedAmount">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
               <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <%--  <asp:Label ID="Label4" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                    &nbsp;--%><asp:Label ID="Label5" runat="server" Text='<%# Bind("DurationDescription") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oustanding Balance">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# (Decimal)Eval("TotalContribution") - (Decimal)Eval("TotalWithdrawal") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MaturityDate" SortExpression="MaturityDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MaturityDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("MaturityDate", "{0:D}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Is Matured">
                <ItemTemplate>
                    <asp:Image ID="Image1" Width="22px" Height="22px" ImageUrl='<%# Utils.GetIsMaturedStatusImage(Eval("MaturityDate")) %>'
                        runat="server" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
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
    <asp:SqlDataSource ID="FixedDepositSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
        SelectCommand="SELECT Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, Investments.InvestmentTypeId, Investments.IsActive, CONVERT (nvarchar(5), Investments.Duration) + ' ' + LoanDurations.Description AS DurationDescription, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal FROM Investments INNER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId WHERE (Investments.InvestmentTypeId = @InvestmentTypeId) AND (Investments.MemberID = @MemberID) AND (Investments.IsActive = 1) AND (Investments.IsDeleted &lt;&gt; 1) ORDER BY Investments.CreatedDate" 
        
        
        DeleteCommand="DELETE FROM Investments WHERE (InvestmentID = @InvestmentID)" 
        ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="InvestmentTypeId" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="" Name="MemberID" QueryStringField="mid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RegularInvestmentsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
        SelectCommand="SELECT Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, Investments.InvestmentTypeId, Investments.IsActive, LoanDurations.Description AS DurationDescription, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedInterest(Investments.InvestmentID) AS TotalAppliedInterest, dbo.GetBalance(Investments.InvestmentID) AS Balance, dbo.GetTotalAppliedDeduction(Investments.InvestmentID) AS TotalAppliedDeduction FROM Investments LEFT OUTER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId WHERE (Investments.MemberID = @MemberId) AND (Investments.IsActive = 1) AND (Investments.IsDeleted &lt;&gt; 1) AND (Investments.InvestmentTypeId = (SELECT AccountTypes.DefaultInvestmentTypeID FROM Members INNER JOIN AccountTypes ON Members.AccountTypeID = AccountTypes.AccountTypeId WHERE (Members.MemberId = Investments.MemberID)))" 
        
        
        
        
        DeleteCommand="DELETE FROM Investments WHERE (InvestmentID = @InvestmentID)" 
        ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SUSUSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
        SelectCommand="SELECT InvestmentID, MemberID, CreatedDate, CreatedBy, GroupId, IsActive, dbo.GetTotalInvestmentContribution(InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedInterest(InvestmentID) AS TotalAppliedInterest, dbo.GetBalance(InvestmentID) AS Balance, dbo.GetTotalAppliedDeduction(InvestmentID) AS TotalAppliedDeduction FROM Investments WHERE (MemberID = @MemberId) AND (InvestmentTypeId = 2) AND (IsActive = 1) AND (IsDeleted &lt;&gt; 1)" 
        
        
        DeleteCommand="DELETE FROM Investments WHERE (InvestmentID = @InvestmentID)" 
        ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
