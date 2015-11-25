<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Withdrawal.aspx.cs" Inherits="LoanWebApplication4.Withdrawal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 130px;
        }
        .style3
        {
            width: 102px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Member Withdrawal</h1>
    <div class="DataSection">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" 
            DataSourceID="MemberSqlDataSource1">
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
                        <td class="style1">
                            <b>First Name:</b></td>
                        <td>
                            <asp:Label ID="MemberFirstNameLabel" runat="server" 
                                Text='<%# Bind("MemberFirstName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <b>Last Name:</b></td>
                        <td>
                            <asp:Label ID="MemberLastNameLabel" runat="server" 
                                Text='<%# Bind("MemberLastName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <b>Balance:</b></td>
                        <td>
                            <asp:Label ID="BalanceLabel" runat="server" Text='<%# Bind("Balance") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <b>Branch:</b></td>
                        <td>
                            <asp:Label ID="MemberBranchLabel" runat="server" 
                                Text='<%# Bind("MemberBranch") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">
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
            SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
  

  <h3>New Withdrawal</h3>
  <div class="DataSection">
      <asp:FormView ID="FormView2" runat="server" DataKeyNames="MemberWithdrawalId" 
          DataSourceID="WithdrawalHistorySqlDataSource1" DefaultMode="Insert" 
          Width="552px">
          <EditItemTemplate>
              MemberWithdrawalId:
              <asp:Label ID="MemberWithdrawalIdLabel1" runat="server" 
                  Text='<%# Eval("MemberWithdrawalId") %>' />
              <br />
              MemberId:
              <asp:TextBox ID="MemberIdTextBox" runat="server" 
                  Text='<%# Bind("MemberId") %>' />
              <br />
              WithdrawalAmount:
              <asp:TextBox ID="WithdrawalAmountTextBox" runat="server" 
                  Text='<%# Bind("WithdrawalAmount") %>' />
              <br />
              WithdrawnBy:
              <asp:TextBox ID="WithdrawnByTextBox" runat="server" 
                  Text='<%# Bind("WithdrawnBy") %>' />
              <br />
              WithdrawalIssuedByUserId:
              <asp:TextBox ID="WithdrawalIssuedByUserIdTextBox" runat="server" 
                  Text='<%# Bind("WithdrawalIssuedByUserId") %>' />
              <br />
              DateCreated:
              <asp:TextBox ID="DateCreatedTextBox" runat="server" 
                  Text='<%# Bind("DateCreated") %>' />
              <br />
              CreatedBy:
              <asp:TextBox ID="CreatedByTextBox" runat="server" 
                  Text='<%# Bind("CreatedBy") %>' />
              <br />
              <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                  CommandName="Update" Text="Update" />
              &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
          </EditItemTemplate>
          <InsertItemTemplate>
              <table style="width:100%;">
                  <tr>
                      <td class="style3">
                          Amount:
                      </td>
                      <td>
                          <asp:TextBox ID="WithdrawalAmountTextBox" runat="server" 
                              Text='<%# Bind("WithdrawalAmount") %>' Width="200px" />
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style3">
                          Withdrawal By:</td>
                      <td>
                          <asp:TextBox ID="WithdrawnByTextBox" runat="server" 
                              Text='<%# Bind("WithdrawnBy") %>' Width="200px" />
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style3">
                          &nbsp;</td>
                      <td>
                          <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                              CommandName="Insert" Text="Save" />
                          &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
              </table>
          </InsertItemTemplate>
          <ItemTemplate>
              MemberWithdrawalId:
              <asp:Label ID="MemberWithdrawalIdLabel" runat="server" 
                  Text='<%# Eval("MemberWithdrawalId") %>' />
              <br />
              MemberId:
              <asp:Label ID="MemberIdLabel" runat="server" Text='<%# Bind("MemberId") %>' />
              <br />
              WithdrawalAmount:
              <asp:Label ID="WithdrawalAmountLabel" runat="server" 
                  Text='<%# Bind("WithdrawalAmount") %>' />
              <br />
              WithdrawnBy:
              <asp:Label ID="WithdrawnByLabel" runat="server" 
                  Text='<%# Bind("WithdrawnBy") %>' />
              <br />
              WithdrawalIssuedByUserId:
              <asp:Label ID="WithdrawalIssuedByUserIdLabel" runat="server" 
                  Text='<%# Bind("WithdrawalIssuedByUserId") %>' />
              <br />
              DateCreated:
              <asp:Label ID="DateCreatedLabel" runat="server" 
                  Text='<%# Bind("DateCreated") %>' />
              <br />
              CreatedBy:
              <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
              <br />
              <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                  CommandName="Edit" Text="Edit" />
              &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                  CommandName="Delete" Text="Delete" />
              &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                  CommandName="New" Text="New" />
          </ItemTemplate>
      </asp:FormView>
  </div>


    <h3>withdrawal History</h3>  <div class="DataSection">
    <asp:GridView ID="GridView1" Width="97%" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MemberWithdrawalId" 
        DataSourceID="WithdrawalHistorySqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="DateCreated" HeaderText="Date" 
                SortExpression="DateCreated" />
            <asp:BoundField DataField="MemberWithdrawalId" HeaderText="MemberWithdrawalId" 
                InsertVisible="False" ReadOnly="True" SortExpression="MemberWithdrawalId" 
                Visible="False" />
            <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                SortExpression="MemberId" Visible="False" />
            <asp:BoundField DataField="WithdrawalAmount" HeaderText="Amount" 
                SortExpression="WithdrawalAmount" />
            <asp:BoundField DataField="WithdrawnBy" HeaderText="Withdrawal By" 
                SortExpression="WithdrawnBy" />
            <asp:BoundField DataField="WithdrawalIssuedByUserId" 
                HeaderText="WithdrawalIssuedByUserId" SortExpression="WithdrawalIssuedByUserId" 
                Visible="False" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" 
                SortExpression="CreatedBy" Visible="False" />
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
    <asp:SqlDataSource ID="WithdrawalHistorySqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [MemberWithdrawals] WHERE [MemberWithdrawalId] = @MemberWithdrawalId" 
        InsertCommand="INSERT INTO [MemberWithdrawals] ([MemberId], [WithdrawalAmount], [WithdrawnBy], [WithdrawalIssuedByUserId], [DateCreated], [CreatedBy]) VALUES (@MemberId, @WithdrawalAmount, @WithdrawnBy, @WithdrawalIssuedByUserId, @DateCreated, @CreatedBy)" 
        SelectCommand="SELECT * FROM [MemberWithdrawals] WHERE ([MemberId] = @MemberId)" 
        UpdateCommand="UPDATE [MemberWithdrawals] SET [MemberId] = @MemberId, [WithdrawalAmount] = @WithdrawalAmount, [WithdrawnBy] = @WithdrawnBy, [WithdrawalIssuedByUserId] = @WithdrawalIssuedByUserId, [DateCreated] = @DateCreated, [CreatedBy] = @CreatedBy WHERE [MemberWithdrawalId] = @MemberWithdrawalId">
        <DeleteParameters>
            <asp:Parameter Name="MemberWithdrawalId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MemberId" Type="Int32" />
            <asp:Parameter Name="WithdrawalAmount" Type="Decimal" />
            <asp:Parameter Name="WithdrawnBy" Type="String" />
            <asp:Parameter Name="WithdrawalIssuedByUserId" Type="Int32" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MemberId" Type="Int32" />
            <asp:Parameter Name="WithdrawalAmount" Type="Decimal" />
            <asp:Parameter Name="WithdrawnBy" Type="String" />
            <asp:Parameter Name="WithdrawalIssuedByUserId" Type="Int32" />
            <asp:Parameter Name="DateCreated" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="MemberWithdrawalId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
