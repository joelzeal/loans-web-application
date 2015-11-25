﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="LoanWebApplication4.Deposit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 130px;
        }
        .style3
        {
            width: 108px;
        }
        .style4
        {
            width: 154px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Member Deposit</h1>
    <div class="DataSection">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:170px">
                <asp:Image ID="Image1" Width="135px" CssClass="memberImageBox2"  runat="server" />
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
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" 
            DataSourceID="MemberSqlDataSource1" Width="423px">
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
            SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)" 
            UpdateCommand="UPDATE Members SET Balance = Balance + @DepositAmount WHERE (MemberId = @MemberId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
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
  

  <h3>New Deposit</h3>
  <div class="DataSection">
      <asp:FormView ID="FormView2" runat="server" DataKeyNames="MemberDepositId" 
          DataSourceID="WithdrawalHistorySqlDataSource1" DefaultMode="Insert" 
          Width="552px">
          <EditItemTemplate>
              MemberDepositId:
              <asp:Label ID="MemberDepositIdLabel1" runat="server" 
                  Text='<%# Eval("MemberDepositId") %>' />
              <br />
              MemberId:
              <asp:TextBox ID="MemberIdTextBox" runat="server" 
                  Text='<%# Bind("MemberId") %>' />
              <br />
              MemberDepositAmount:
              <asp:TextBox ID="MemberDepositAmountTextBox" runat="server" 
                  Text='<%# Bind("MemberDepositAmount") %>' />
              <br />
              DepositedBy:
              <asp:TextBox ID="DepositedByTextBox" runat="server" 
                  Text='<%# Bind("DepositedBy") %>' />
              <br />
              DepositDate:
              <asp:TextBox ID="DepositDateTextBox" runat="server" 
                  Text='<%# Bind("DepositDate") %>' />
              <br />
              ReceivedByUserId:
              <asp:TextBox ID="ReceivedByUserIdTextBox" runat="server" 
                  Text='<%# Bind("ReceivedByUserId") %>' />
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
                          Deposit Amount:
                      </td>
                      <td class="style4">
                          <asp:TextBox ID="MemberDepositAmountTextBox" runat="server" 
                              ontextchanged="DepositAmountTextBox_TextChanged" 
                              Text='<%# Bind("MemberDepositAmount") %>' ValidationGroup="vg1" />
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="MemberDepositAmountTextBox" 
                              ErrorMessage="Deposit amount is required" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="style3">
                          DepositedBy:
                      </td>
                      <td class="style4">
                          <asp:TextBox ID="DepositedByTextBox" runat="server" 
                              Text='<%# Bind("DepositedBy") %>' ValidationGroup="vg1" />
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                              ControlToValidate="DepositedByTextBox" ErrorMessage="Deposited by is required" 
                              ForeColor="#CC3300"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td class="style3">
                          &nbsp;</td>
                      <td class="style4">
                          <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                              CommandName="Insert" Text="Save" ValidationGroup="vg1" />
                          &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
              </table>
          </InsertItemTemplate>
          <ItemTemplate>
              MemberDepositId:
              <asp:Label ID="MemberDepositIdLabel" runat="server" 
                  Text='<%# Eval("MemberDepositId") %>' />
              <br />
              MemberId:
              <asp:Label ID="MemberIdLabel" runat="server" Text='<%# Bind("MemberId") %>' />
              <br />
              MemberDepositAmount:
              <asp:Label ID="MemberDepositAmountLabel" runat="server" 
                  Text='<%# Bind("MemberDepositAmount") %>' />
              <br />
              DepositedBy:
              <asp:Label ID="DepositedByLabel" runat="server" 
                  Text='<%# Bind("DepositedBy") %>' />
              <br />
              DepositDate:
              <asp:Label ID="DepositDateLabel" runat="server" 
                  Text='<%# Bind("DepositDate") %>' />
              <br />
              ReceivedByUserId:
              <asp:Label ID="ReceivedByUserIdLabel" runat="server" 
                  Text='<%# Bind("ReceivedByUserId") %>' />
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


    <h3>Deposit History</h3>  <div class="DataSection">
    <asp:GridView ID="GridView1" Width="97%" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MemberDepositId" 
        DataSourceID="WithdrawalHistorySqlDataSource1" ForeColor="#333333" 
        GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="DepositDate" HeaderText="Date" 
                SortExpression="DepositDate" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberDepositId" HeaderText="MemberDepositId" 
                InsertVisible="False" ReadOnly="True" SortExpression="MemberDepositId" 
                Visible="False" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                SortExpression="MemberId" Visible="False" />
            <asp:BoundField DataField="MemberDepositAmount" HeaderText="Amount" 
                SortExpression="MemberDepositAmount" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="DepositedBy" HeaderText="Deposited By" 
                SortExpression="DepositedBy" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="ReceivedByUserId" 
                HeaderText="ReceivedByUserId" SortExpression="ReceivedByUserId" 
                Visible="False" >
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
    <asp:SqlDataSource ID="WithdrawalHistorySqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [MemberDeposits] WHERE [MemberDepositId] = @MemberDepositId" 
        InsertCommand="INSERT INTO [MemberDeposits] ([MemberId], [MemberDepositAmount], [DepositedBy], [DepositDate], [ReceivedByUserId]) VALUES (@MemberId, @MemberDepositAmount, @DepositedBy, GetDate(), @ReceivedByUserId)" 
        SelectCommand="SELECT * FROM [MemberDeposits] WHERE ([MemberId] = @MemberId) ORDER BY [DepositDate] DESC" 
        
        UpdateCommand="UPDATE [MemberDeposits] SET [MemberId] = @MemberId, [MemberDepositAmount] = @MemberDepositAmount, [DepositedBy] = @DepositedBy, [DepositDate] = @DepositDate, [ReceivedByUserId] = @ReceivedByUserId WHERE [MemberDepositId] = @MemberDepositId" 
        oninserted="WithdrawalHistorySqlDataSource1_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="MemberDepositId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
            <asp:Parameter Name="MemberDepositAmount" Type="Decimal" />
            <asp:Parameter Name="DepositedBy" Type="String" />
            <asp:Parameter Name="ReceivedByUserId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MemberId" Type="Int32" />
            <asp:Parameter Name="MemberDepositAmount" Type="Decimal" />
            <asp:Parameter Name="DepositedBy" Type="String" />
            <asp:Parameter Name="DepositDate" Type="DateTime" />
            <asp:Parameter Name="ReceivedByUserId" Type="Int32" />
            <asp:Parameter Name="MemberDepositId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
