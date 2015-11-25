<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="GroupInvestments.aspx.cs" Inherits="LoanWebApplication4.admin.GroupInvestments" %>

<%@ Register Src="~/UserControls/GroupToolBarWebUserControl.ascx" TagName="GroupToolBarWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style28
        {
            width: 95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <h2>
                    Group Investments</h2>
            </td>
            <td align="right">
                <uc1:GroupToolBarWebUserControl ID="GroupToolBarWebUserControl1" runat="server" />
            </td>
        </tr>
    </table>
    <div class="DataSection">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 170px">
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="GroupId" DataSourceID="vwGroupsSqlDataSource"
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
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "MemberGroupDetails.aspx?gid=" + Eval("GroupId") %>'><img alt="" src="../images/Groups.png" class="memberImageBox2" style="height: 80px; width: 105px" /></asp:HyperLink>
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
                </td>
                <td valign="top">
                    &nbsp;
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
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator">
    </div>
    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="InvestmentID" DataSourceID="LoansSqlDataSource"
        ForeColor="#333333" GridLines="None" 
               EmptyDataText="No investment associated with the current member." 
             >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,MemberID" DataNavigateUrlFormatString="~/admin/NewInvestment_MemberPreSelected.aspx?InvId={0}&mid={1}"
                NavigateUrl="~/admin/NewInvestment_MemberPreSelected.aspx" Text="Edit">
                <HeaderStyle Width="50px" />
            </asp:HyperLinkField>--%>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,GroupID" DataNavigateUrlFormatString="~/admin/GroupInvestmentContribution.aspx?InvId={0}&amp;gid={1}"
                NavigateUrl="~/admin/GroupInvestmentContribution.aspx" Text="Contribution">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,GroupID" DataNavigateUrlFormatString="~/admin/GroupInvestmentWithdrawal.aspx?InvId={0}&amp;gid={1}"
                NavigateUrl="~/admin/GroupInvestmentWithdrawal.aspx" Text="Withdrawal">
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
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TotalContribution") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label43" runat="server" Text='<%# Eval("Balance1", "{0:C}") %>'></asp:Label>
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
                </td>
            </tr>
        </table>
    </div>
    <div class="seperator">
    </div>
    <asp:GridView Width="100%" ID="SUSUGridView" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="InvestmentID" DataSourceID="SUSUSqlDataSource"
        ForeColor="#333333" GridLines="None" EmptyDataText="No SUSU investment associated with the current member.">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
           <%-- <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>--%>
           <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,GroupID" DataNavigateUrlFormatString="~/admin/GroupsSUSUInvestmentContribution.aspx?InvId={0}&amp;gid={1}"
                NavigateUrl="~/admin/GroupsSUSUInvestmentContribution.aspx" Text="Contribution">
                <HeaderStyle Width="100px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="InvestmentID,GroupID" DataNavigateUrlFormatString="~/admin/GroupSUSUInvestmentWithdrawal.aspx?InvId={0}&amp;gid={1}"
                NavigateUrl="~/admin/GroupSUSUInvestmentWithdrawal.aspx" Text="Withdrawal">
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
                    <asp:Label ID="Label4" runat="server" Text='<%# (Decimal)Eval("TotalContribution") - (Decimal)Eval("TotalWithdrawal") %>'></asp:Label>
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
                   <%-- <asp:Label ID="Label4" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
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
        
            SelectCommand="SELECT Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, Investments.InvestmentTypeId, Investments.IsActive, CONVERT (nvarchar(5), Investments.Duration) + ' ' + LoanDurations.Description AS DurationDescription, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal FROM Investments INNER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId WHERE (Investments.InvestmentTypeId = @InvestmentTypeId) AND (Investments.GroupId = @GroupID) AND (Investments.IsActive = 1) AND (Investments.IsDeleted &lt;&gt; 1) ORDER BY Investments.CreatedDate" 
            
            DeleteCommand="UPDATE Investments SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (InvestmentID = @InvestmentID)">
        <DeleteParameters>
            <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="InvestmentTypeId" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="" Name="GroupID" QueryStringField="gid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="LoansSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
            SelectCommand="SELECT Investments.InvestmentID, Investments.MemberID, Investments.CreatedDate, Investments.CreatedBy, Investments.InsterstRate, Investments.InvestmentAmount, Investments.Duration, Investments.Balance, Investments.GroupId, Investments.ContributionFrequencyId, Investments.InterestTypeId, Investments.MaturityDate, Investments.ContributionFreqAmount, Investments.InvestmentCalculationStartDate, Investments.IsMatured, Investments.DurationTypeId, Investments.MaturedAmount, Investments.InvestmentTypeId, Investments.IsActive, LoanDurations.Description AS DurationDescription, dbo.GetTotalInvestmentContribution(Investments.InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(Investments.InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedInterest(Investments.InvestmentID) AS TotalAppliedInterest, dbo.GetBalance(Investments.InvestmentID) AS Balance, dbo.GetTotalAppliedDeduction(Investments.InvestmentID) AS TotalAppliedDeduction FROM Investments LEFT OUTER JOIN LoanDurations ON Investments.DurationTypeId = LoanDurations.LoanDurationId WHERE (Investments.InvestmentTypeId = (SELECT AccountTypes.DefaultInvestmentTypeID FROM AccountTypes INNER JOIN LoanGroups ON AccountTypes.AccountTypeId = LoanGroups.AccountTypeId WHERE (LoanGroups.GroupId = Investments.GroupId))) AND (Investments.GroupId = @GroupId) AND (Investments.IsActive = 1) AND (Investments.IsDeleted = 0)" 
            
            
            
        
        
        
        DeleteCommand="UPDATE Investments SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (InvestmentID = @InvestmentID)">
        <DeleteParameters>
            <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SUSUSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        
            SelectCommand="SELECT InvestmentID, MemberID, CreatedDate, CreatedBy, GroupId, IsActive, dbo.GetTotalInvestmentContribution(InvestmentID) AS TotalContribution, dbo.GetTotalInvestmentWithdrawal(InvestmentID) AS TotalWithdrawal, dbo.GetTotalAppliedInterest(InvestmentID) AS TotalAppliedInterest, dbo.GetBalance(InvestmentID) AS Balance, dbo.GetTotalAppliedDeduction(InvestmentID) AS TotalAppliedDeduction FROM Investments WHERE (InvestmentTypeId = 2) AND (GroupId = @GroupID) AND (IsActive = 1) AND (IsDeleted &lt;&gt; 1)" 
            
            
        DeleteCommand="UPDATE Investments SET IsDeleted = 1, ModifiedBy = @ModifiedBy, ModifiedDate = GETDATE() WHERE (InvestmentID = @InvestmentID)">
        <DeleteParameters>
            <asp:SessionParameter Name="ModifiedBy" SessionField="CurrentUser" />
            <asp:Parameter Name="InvestmentID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="GroupID" QueryStringField="gid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
