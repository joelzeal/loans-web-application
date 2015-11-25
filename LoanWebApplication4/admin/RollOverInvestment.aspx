<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" EnableEventValidation="false"
    CodeBehind="RollOverInvestment.aspx.cs" Inherits="LoanWebApplication4.admin.RollOverInvestment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../UserControls/LoansToolBarWebUserControl.ascx" tagname="LoansToolBarWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style31
        {
            width: 165px;
        }
        .style33
        {
            width: 159px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Rollover Investment</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        Select a member/group from the dropdown list below or add a new member/group to
        proceed.
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                        Width="102px">
                        <asp:ListItem>Individual</asp:ListItem>
                        <asp:ListItem>Group</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                        SelectCommand="SELECT * FROM [MembersView] ORDER BY [Member]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table id="tblMember" visible="false" runat="server" border="0" cellpadding="0" cellspacing="0" server="true"
            width="100%">
            <tr>
                <td class="style31">
                    &nbsp;Member:
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="margin-left: 40px">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="MembersSqlDataSource"
                                    DataTextField="Member" DataValueField="MemberId" OnDataBound="DropDownList1_DataBound"
                                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table id="tblGroup" runat="server" border="0" cellpadding="0" cellspacing="0" server="true"
            visible="false" width="100%">
            <tr>
                <td class="style31">
                    &nbsp;Group:
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:DropDownList ID="cboGroupName" runat="server" AutoPostBack="True" DataSourceID="MemberGroupsSqlDataSource"
                                    DataTextField="GroupName" DataValueField="GroupId" OnDataBound="cboGroupName_DataBound"
                                    OnSelectedIndexChanged="cboGroupName_SelectedIndexChanged" Width="300px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="MemberGroupsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                    SelectCommand="SELECT * FROM [vwGroups] ORDER BY [GroupName]"></asp:SqlDataSource>
                                <asp:HiddenField ID="InvestmentIDHiddenField" runat="server" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <asp:Panel ID="plDetails" Visible="false"  runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="style33" valign="top">
                Matured Investments: 
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtFriend" runat="server" ReadOnly="true" Width="295px" />
                        <asp:Panel ID="FriendDropDown" runat="server" ScrollBars="None" Style="max-height: 150px;
                            overflow: auto; border: 1px solid red">
                            <asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="InvestmentID" ForeColor="#333333" GridLines="None" OnRowDataBound="FriendGridView_RowDataBound"
                                OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged">
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="InvestmentID" HeaderText="InvestmentID"
                                        InsertVisible="False" ReadOnly="True" SortExpression="InvestmentID" 
                                        Visible="False" />
                                    <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                                        SortExpression="MemberID" Visible="False" />
                                    <asp:TemplateField HeaderText="Investment Date" SortExpression="CreatedDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("CreatedDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="InvestmentAmount" HeaderText="InvestmentAmount" 
                                        SortExpression="InvestmentAmount">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DurationDescription" HeaderText="Duration" 
                                        SortExpression="DurationDescription">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Maturity Date" SortExpression="MaturityDate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MaturityDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" 
                                                Text='<%# Bind("MaturityDate", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MaturedAmount" SortExpression="MaturedAmount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MaturedAmount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaturedAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </asp:Panel>
                        <cc1:dropdownextender id="DropDownExtender1" runat="server" dropdowncontrolid="FriendDropDown"
                            targetcontrolid="txtFriend" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="FriendGridView" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style33">
                &nbsp;</td>
            <td>
                <asp:FormView ID="FormView1" CssClass="rolloverDataForm" Width="650"  
                    runat="server" DataKeyNames="InvestmentID" 
                    DataSourceID="vwMemberInvestmentsWithContAndWithdrawalSqlDataSource">
                    <ItemTemplate>
                        <table style="width:100%;margin:15px;">
                            <tr>
                                <td>
                                    Investment Date</td>
                                <td>
                                    <asp:Label ID="CreatedDateLabel" runat="server" 
                                        Text='<%# Bind("CreatedDate") %>' style="font-weight: 700" />
                                </td>
                                <td>
                                    Investment Amount</td>
                                <td>
                                    <asp:Label ID="InvestmentAmountLabel" runat="server" 
                                        Text='<%# Bind("InvestmentAmount") %>' CssClass="bold" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Insterst Rate</td>
                                <td>
                                    <asp:Label ID="InsterstRateLabel" runat="server" 
                                        Text='<%# Bind("InsterstRate") %>' CssClass="bold" />
                                </td>
                                <td>
                                    Matured Amount</td>
                                <td>
                                    <asp:Label ID="MaturedAmountLabel" runat="server" 
                                        Text='<%# Bind("MaturedAmount") %>' CssClass="bold" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    InterestTypeId</td>
                                <td>
                                    <asp:Label ID="InterestTypeIdLabel" runat="server" 
                                        Text='<%# Bind("InterestTypeId") %>' CssClass="bold" />
                                </td>
                                <td>
                                    Maturity Date</td>
                                <td>
                                    <asp:Label ID="MaturityDateLabel" runat="server" 
                                        Text='<%# Bind("MaturityDate") %>' CssClass="bold" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Is Matured</td>
                                <td>
                                    <asp:CheckBox ID="IsMaturedCheckBox" runat="server" 
                                        Checked='<%# Bind("IsMatured") %>' Enabled="false" CssClass="bold" />
                                </td>
                                <td>
                                    Duration</td>
                                <td>
                                    <asp:Label ID="DurationDescriptionLabel" runat="server" 
                                        Text='<%# Bind("DurationDescription") %>' CssClass="bold" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Investment Type</td>
                                <td>
                                    <asp:Label ID="InvestmentTypeIdLabel" runat="server" 
                                        Text='<%# Bind("InvestmentTypeDescription") %>' CssClass="bold" />
                                </td>
                                <td>
                                    Total Contribution</td>
                                <td>
                                    <asp:Label ID="TotalContrilbutionLabel" runat="server" 
                                        Text='<%# Bind("TotalContrilbution") %>' CssClass="bold" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    Total Withdrawal</td>
                                <td>
                                    <asp:Label ID="TotalWithdrawalLabel" runat="server" 
                                        Text='<%# Bind("TotalWithdrawal") %>' CssClass="bold" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                        <asp:SqlDataSource ID="vwMemberInvestmentsWithContAndWithdrawalSqlDataSource" 
                            runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                            
                            
                            
                            
                    
                    
                    SelectCommand="SELECT InvestmentID, MemberID, CreatedDate, CreatedBy, InsterstRate, InvestmentAmount, Duration, Balance, GroupId, ContributionFrequencyId, InterestTypeId, MaturityDate, ContributionFreqAmount, InvestmentCalculationStartDate, IsMatured, DurationTypeId, MaturedAmount, InvestmentTypeId, IsActive, TotalContrilbution, TotalWithdrawal, DurationDescription, InvestmentTypeDescription FROM vwMemberInvestmentWithTotalContributionAndWithdrawal WHERE (InvestmentID = @InvestmentId)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="InvestmentIDHiddenField" Name="InvestmentId" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style33">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Rollover" 
                    onclick="Button1_Click" Width="200px" Visible="False" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style33">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </asp:Panel>
    <br />
</asp:Content>
