<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="NewLoan.aspx.cs" ValidateRequest="false" Inherits="LoanWebApplication4.admin.NewLoan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 67px;
        }
        .style4
        {
            width: 289px;
        }
        .style5
        {
            width: 132px;
        }
        .style13
        {
            width: 143px;
        }
        .style19
        {
            width: 264px;
        }
        .style24
        {
            width: 377px;
        }
        .style25
        {
            width: 160px;
        }
        .style26
        {
            width: 275px;
        }
        .style27
        {
            width: 179px;
        }
        .style28
        {
            width: 95px;
        }
        .style29
        {
            width: 66px;
        }
        .style30
        {
            width: 70px;
        }
        .style31
        {
            width: 147px;
        }
    </style>
    <script src="http://localhost:1165/Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="http://localhost:1165/Scripts/jquery.fancybox.js" type="text/javascript"></script>
    <script src="http://localhost:1165/Scripts/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script src="http://localhost:1165/Scripts/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
    <link href="http://localhost:1165/Styles/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            /*
            *  Simple image gallery. Uses default settings
            */

            $('.fancybox').fancybox();

            /*
            *  Different effects
            */
        });

        function callClick() {
            var saveButton = document.getElementById('<%=Button2.ClientID %>');
            saveButton.Click();


            parent.jQuery.fancybox.close();
            __doPostBack('<%=Button2.ClientID %>', "");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        New Loan<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <br />
    <div >
        Select a member/group from the dropdown list below or add a new member/group to proceed.
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    Width="102px" AutoPostBack="True">
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Group</asp:ListItem>
                </asp:RadioButtonList>
               
                <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                    SelectCommand="SELECT * FROM [MembersView] ORDER BY [Member]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

    <table border="0" server="true" id="tblMember" width="100%" runat="server" cellpadding="0" cellspacing="0">
        <tr>
            <td class="style30">

                Member:</td>
             <td>
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="MembersSqlDataSource"
                                DataTextField="Member" DataValueField="MemberId" OnDataBound="DropDownList1_DataBound"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;<asp:ImageButton ID="ImageButton1" ToolTip="Add New Member" runat="server"
                                Height="21px" ImageUrl="~/images/AddLoan.png" Width="19px" OnClick="ImageButton1_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table  border="0" server="true" visible="false" id="tblGroup" width="100%" runat="server" cellpadding="0" cellspacing="0">
        <tr>
            <td class="style29">

                Group:</td>
             <td>
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:DropDownList ID="cboGroupName" runat="server" AutoPostBack="True" DataSourceID="MemberGroupsSqlDataSource"
                                DataTextField="GroupName" DataValueField="GroupId"
                                OnSelectedIndexChanged="cboGroupName_SelectedIndexChanged" 
                                ondatabound="cboGroupName_DataBound">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="MemberGroupsSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [vwGroups] ORDER BY [GroupName]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;<asp:ImageButton 
                                ID="btnGroup" ToolTip="Add New Member" runat="server"
                                Height="21px" ImageUrl="~/images/AddLoan.png" Width="19px" 
                                OnClick="btnGroup_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
     </div>
    <br />
    <div style="border-bottom:1px solid gray"></div>
    <h3 runat="server" id="memberHeader">
        Member Details</h3>
    <div class="DataSection" visible="false" id="dataSection" runat="server">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 170px">
                    <asp:Image ID="Image1" Width="135px"  runat="server" 
                        CssClass="memberImageBox2" />
                    
                </td>
                <td valign="top">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberId" DataSourceID="MemberSqlDataSource1"
                        Width="458px">
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
                                    <td class="style31">
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
                                    <td class="style31">
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
                                    <td class="style31">
                                        <b>Branch:</b>
                                    </td>
                                    <td>
                                        <asp:Label ID="MemberBranchLabel" runat="server" Text='<%# Bind("MemberBranch") %>' />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style31">
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
                        SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)" UpdateCommand="UPDATE Members SET Balance = Balance - @WithdrawalAmount WHERE (MemberId = @MemberId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="MemberId" PropertyName="SelectedValue"
                                Type="Int32" />
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

     <div class="DataSection" id="dvGroupdataSection" visible="false" runat="server">
        
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
                 <asp:TextBox ID="GroupNameTextBox" runat="server" 
                     Text='<%# Bind("GroupName") %>' />
                 <br />
                 Description:
                 <asp:TextBox ID="DescriptionTextBox" runat="server" 
                     Text='<%# Bind("Description") %>' />
                 <br />
                 GroupId:
                 <asp:TextBox ID="GroupIdTextBox" runat="server" Text='<%# Bind("GroupId") %>' />
                 <br />
                 GroupMemberCount:
                 <asp:TextBox ID="GroupMemberCountTextBox" runat="server" 
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
                                 NavigateUrl='<%# "MemberGroupDetails.aspx?GroupId=" + Eval("GroupId")+"&RedirectUrl=NewLoan.aspx" %>'><img alt="" src="../images/Groups.png" class="memberImageBox2" style="height: 80px; width: 105px" /></asp:HyperLink>
                        
                            
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
                 <asp:ControlParameter ControlID="cboGroupName" Name="GroupId" 
                     PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
        
     </div>
    <h3 runat="server" id="LoanHeader">
        Loan Details</h3>
    <div class="DataSection" visible="false" runat="server" id="loanDataSection">
        <asp:SqlDataSource ID="LoanSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
            DeleteCommand="DELETE FROM [Loans] WHERE [LoanID] = @LoanID" InsertCommand="INSERT INTO [Loans] ([MemberId], [Interest], [InterestTypeId], [Principal], [Amount], [Duration], [payWithContribution], [RepaymentFrequencyId], [CreatedDate]) VALUES (@MemberId, @Interest, @InterestTypeId, @Principal, @Amount, @Duration, @payWithContribution, @RepaymentFrequencyId, @CreatedDate)"
            SelectCommand="SELECT * FROM [Loans]" UpdateCommand="UPDATE [Loans] SET [MemberId] = @MemberId, [Interest] = @Interest, [InterestTypeId] = @InterestTypeId, [Principal] = @Principal, [Amount] = @Amount, [Duration] = @Duration, [payWithContribution] = @payWithContribution, [RepaymentFrequencyId] = @RepaymentFrequencyId, [CreatedDate] = @CreatedDate WHERE [LoanID] = @LoanID">
            <DeleteParameters>
                <asp:Parameter Name="LoanID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MemberId" Type="Int32" />
                <asp:Parameter Name="Interest" Type="Decimal" />
                <asp:Parameter Name="InterestTypeId" Type="Int32" />
                <asp:Parameter Name="Principal" Type="Decimal" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="Duration" Type="Decimal" />
                <asp:Parameter Name="payWithContribution" Type="Boolean" />
                <asp:Parameter Name="RepaymentFrequencyId" Type="Int32" />
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MemberId" Type="Int32" />
                <asp:Parameter Name="Interest" Type="Decimal" />
                <asp:Parameter Name="InterestTypeId" Type="Int32" />
                <asp:Parameter Name="Principal" Type="Decimal" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter Name="Duration" Type="Decimal" />
                <asp:Parameter Name="payWithContribution" Type="Boolean" />
                <asp:Parameter Name="RepaymentFrequencyId" Type="Int32" />
                <asp:Parameter Name="CreatedDate" Type="DateTime" />
                <asp:Parameter Name="LoanID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
            <asp:View ID="View1" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="style13">
                            Loan Type:</td>
                        <td class="style24">
                            <asp:DropDownList ID="cboLoanType" runat="server" 
                                DataSourceID="LoanTypesSqlDataSource" DataTextField="Description" 
                                DataValueField="LoanTypeId" Width="250px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="LoanTypesSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [LoanTypes] ORDER BY [Description]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style27">
                            Repayment Frequency:
                        </td>
                        <td class="style19">
                            <asp:DropDownList ID="RepaymentFrequencyDropdownList" runat="server" DataSourceID="PaymentFrequencySqlDataSource"
                                DataTextField="Description" DataValueField="RepaymentFrequencyId" OnSelectedIndexChanged="RepaymentFrequencyDropdownList_SelectedIndexChanged"
                                Width="250px" OnDataBound="RepaymentFrequencyDropdownList_DataBound">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToValidate="RepaymentFrequencyDropdownList" ErrorMessage="*" 
                                Operator="NotEqual" SetFocusOnError="True" style="color: #CC3300" 
                                ValidationGroup="g1" ValueToCompare="----Select----"></asp:CompareValidator>
                            <asp:SqlDataSource ID="PaymentFrequencySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT * FROM [RepaymentFrequencies] ORDER BY [Description]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            Principal:
                        </td>
                        <td class="style24">
                            <asp:TextBox ID="PrincipalTextBox" runat="server" Style="text-align: right" 
                                Width="250px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="PrincipalTextBox" ErrorMessage="*" ForeColor="Red" 
                                ToolTip="Principal is required" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="PrincipalTextBox" ErrorMessage="Invalid Number" 
                                ForeColor="Red" ValidationExpression="/^\d+\.?\d*$/" ValidationGroup="g1"></asp:RegularExpressionValidator>
                        </td>
                        <td class="style27">
                            Guarantor:
                        </td>
                        <td class="style19">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="cboGuarantor" runat="server" DataSourceID="GuarantorsSqlDataSource"
                                            DataTextField="Name" DataValueField="GuarantorId">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <a class="fancybox" href="#guarantorDetails" title="Add Guarantor Details">
                                            <img src="../images/AddLoan.png" alt="Add New" height="22"/></a>
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="GuarantorsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT * FROM [vwGuarantor] ORDER BY [Name]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13" valign="top">
                            &nbsp;Interest Type:
                        </td>
                        <td class="style24" valign="top">
                            <asp:DropDownList ID="InterestTypeDropDownList" runat="server" Width="250px">
                                <asp:ListItem Value="50">----Select----</asp:ListItem>
                                <asp:ListItem Value="1">Compound Interest</asp:ListItem>
                                <asp:ListItem Value="2">Simple Interest</asp:ListItem>
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="InterestTypeDropDownList" ErrorMessage="*" 
                                Operator="NotEqual" SetFocusOnError="True" style="color: #CC3300" 
                                ValidationGroup="g1" ValueToCompare="----Select----"></asp:CompareValidator>
                        </td>
                        <td class="style27" valign="top">
                            Collateral:
                        </td>
                        <td class="style19">
                            <asp:DropDownList ID="cboCollateral" runat="server" DataSourceID="CollateralsSqlDataSource"
                                DataTextField="Description" DataValueField="CollateralID" Width="250px" OnDataBound="cboCollateral_DataBound">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CollateralsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT * FROM [Collaterals] ORDER BY [Description]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13" valign="top">
                            Interest Duration:</td>
                        <td class="style24" valign="top">
                            <asp:DropDownList ID="cboInterestDuration" runat="server" AutoPostBack="True" 
                                DataSourceID="InterestPresetsSqlDataSource" DataTextField="Description" 
                                DataValueField="LoanPresetId" OnDataBound="cboInterestDuration_DataBound" 
                                OnSelectedIndexChanged="cboInterestDuration_SelectedIndexChanged" Width="250px">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                ControlToValidate="cboInterestDuration" ErrorMessage="*" Operator="NotEqual" 
                                SetFocusOnError="True" style="color: #CC3300" ValidationGroup="g1" 
                                ValueToCompare="----Select----"></asp:CompareValidator>
                            <asp:SqlDataSource ID="InterestPresetsSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [LoanPresets]"></asp:SqlDataSource>
                        </td>
                        <td class="style27" valign="top">
                            Collateral Description:
                        </td>
                        <td class="style19" rowspan="2">
                            <asp:TextBox ID="txtCollateralDesc" runat="server" Height="44px" 
                                TextMode="MultiLine" Width="356px"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtCollateralDesc_TextBoxWatermarkExtender" runat="server"
                                Enabled="True" TargetControlID="txtCollateralDesc" 
                                WatermarkCssClass="waterMark" 
                                WatermarkText="Describe colateral. eg. Registration Number of vehicle"></asp:TextBoxWatermarkExtender>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            Interest Rate:
                        </td>
                        <td class="style24">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="InterestTextBox" runat="server" Style="text-align: right" 
                                        Width="250px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="InterestTextBox" ErrorMessage="*" ForeColor="Red" 
                                        ToolTip="Interest Rate is required" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="InterestTextBox" ErrorMessage="Invalid Number" 
                                        ForeColor="Red" ValidationExpression="/^\d+\.?\d*$/" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="cboInterestDuration" 
                                        EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td class="style27">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <%--<tr>
                      <td class="style2">
                          &nbsp;</td>
                      <td class="style3">
                          <asp:CheckBox ID="payWithContributionCheckBox" Text="Repay With Contribution" runat="server" 
                              Checked='<%# Bind("payWithContribution") %>' />
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>--%>
                    <tr>
                        <td class="style13" valign="top">
                            Duration Type:
                        </td>
                        <td class="style24" valign="top">
                            <asp:DropDownList ID="cboLoanDurationType" runat="server" 
                                DataSourceID="LoanDurationsSqlDataSource" DataTextField="Description" 
                                DataValueField="LoanDurationId" OnDataBound="cboLoanDurationType_DataBound" 
                                Width="250px">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToValidate="cboLoanDurationType" ErrorMessage="*" Operator="NotEqual" 
                                SetFocusOnError="True" style="color: #CC3300" ValidationGroup="g1" 
                                ValueToCompare="----Select----"></asp:CompareValidator>
                            <asp:SqlDataSource ID="LoanDurationsSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [LoanDurations] ORDER BY [Description]">
                            </asp:SqlDataSource>
                        </td>
                        <td class="style27" valign="middle">
                            Start Calculation From:
                        </td>
                        <td class="style19" valign="top">
                            <asp:TextBox ID="txtStartCalculationFrom" runat="server" Width="250px"></asp:TextBox>
                            <asp:CalendarExtender ID="txtStartCalculationFrom_CalendarExtender" 
                                runat="server" Enabled="True"
                                TargetControlID="txtStartCalculationFrom"></asp:CalendarExtender>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13" valign="top">
                            Duration: </td>
                        <td class="style24" valign="top">
                            <asp:TextBox ID="DurationTextBox" runat="server" Style="text-align: right" 
                                Text='<%# Bind("Duration") %>' Width="250px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="DurationTextBox" ErrorMessage="*" ForeColor="Red" 
                                ToolTip="Duration is required" ValidationGroup="g1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style27" valign="middle">
                            Loan Date:</td>
                        <td class="style19" valign="top">
                             <asp:TextBox ID="txtLoanDate" runat="server" Width="250px"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" 
                                runat="server" Enabled="True"
                                TargetControlID="txtLoanDate"></asp:CalendarExtender></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style24">
                            <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" 
                                ValidationGroup="g1" />
                        </td>
                        <td class="style27">
                            &nbsp;
                        </td>
                        <td class="style19">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div id="guarantorDetails" style="display:none" >
                    <h1>
                        Guarantor Details</h1>
                    <%-- <asp:HyperLink ID="HyperLink1" runat="server" Style="font-weight: 700">Withdrawal</asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Style="font-weight: 700">Deposit</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" Style="font-weight: 700">Statement</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;--%>
                    <asp:HyperLink ID="HyperLink4" runat="server" Style="font-weight: 700">Loans Guaranted</asp:HyperLink>
                    <br />
                    <br />
                    <div>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr valign="top">
                                <td style="width: 230px">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Image ID="Image2" Width="200px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <div class="DataSection">
                                        <table style="width: 98%;">
                                            <tr>
                                                <td class="style2" colspan="3">
                                                    <h4>
                                                        Personal Details</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    First Name:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td class="style3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Last Name:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberLastNameTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Other Name:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberOtherNameTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    DOB:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberDOBNameTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ValidationGroup="g6" ID="RequiredFieldValidator4" runat="server" ControlToValidate="MemberDOBNameTextBox"
                                                        ErrorMessage="Date of birth is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <%--   <tr>
                            <td class="style5">
                                Branch:
                            </td>
                            <td class="style7">
                                <asp:TextBox ID="MemberBranchTextBox" runat="server" Width="200px" 
                                     />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Balance:
                            </td>
                            <td class="style7">
                                <asp:TextBox ID="BalanceTextBox" runat="server" ReadOnly="True" Width="200px" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                       <tr>
                            <td class="style4">
                                Account Number:
                            </td>
                            <td class="style7">
                                <asp:TextBox ID="AccountTextBox" runat="server" Width="200px" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>--%>
                                            <tr>
                                                <td class="style25">
                                                    Identification Type:
                                                </td>
                                                <td class="style26">
                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="IDTypeSqlDataSource"
                                                        DataTextField="Description" DataValueField="IdentificationTypeId">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="IDTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                                        DeleteCommand="DELETE FROM [IdentificationTypes] WHERE [IdentificationTypeId] = @IdentificationTypeId"
                                                        InsertCommand="INSERT INTO [IdentificationTypes] ([Description]) VALUES (@Description)"
                                                        SelectCommand="SELECT * FROM [IdentificationTypes]" UpdateCommand="UPDATE [IdentificationTypes] SET [Description] = @Description WHERE [IdentificationTypeId] = @IdentificationTypeId">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="IdentificationTypeId" Type="Int32" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="Description" Type="String" />
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="Description" Type="String" />
                                                            <asp:Parameter Name="IdentificationTypeId" Type="Int32" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Identification Number:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberIDNumberTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    &nbsp;
                                                </td>
                                                <td class="style26">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style1" colspan="3">
                                                    <h4>
                                                        Contact Information</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Fax:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberFaxTextBox0" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Telephone:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberTelTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Mobile:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberMobileTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Residential Address:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberResidentialTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style25">
                                                    Business Location:
                                                </td>
                                                <td class="style26">
                                                    <asp:TextBox ID="MemberBusinessLocationTextBox" runat="server" Width="200px" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                               </tr>
                            <%-- <tr>
                            <td class="style5">
                                Contact Person:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberContactPersonTextBox" runat="server" Width="200px" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>--%>
                                                <tr>
                                                    <td class="style25">
                                                        &nbsp;
                                                    </td>
                                                    <td class="style26">
                                                        <asp:Button ID="Button2"  ValidationGroup="g6" OnClientClick="callClick()" runat="server" Text="Save" OnClick="Button2_Click" />
                                                        &nbsp;<asp:Button ID="Button3" OnClientClick="javascript:parent.jQuery.fancybox.close();" runat="server" Text="Cancel" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                        </table>
                                    </div>
                                    <%--<asp:Button ID="Button4" runat="server" OnClick="Button2_Click" Text="Save" />--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <b>Breakdown</b>
                <div style="border-bottom: 1px solid gray">
                </div>
                <table style="width: 100%;">
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;Principal:&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblPrincipal" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;Total Loan Amount:
                        </td>
                        <td>
                            <asp:Label ID="lblTotalAmount" runat="server" Style="font-weight: 700"></asp:Label>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;&nbsp;Interest Rate:
                        </td>
                        <td>
                            <asp:Label ID="lblInterestRate" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;Duration:&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblDuration" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;Repayment Frequency:&nbsp;
                        </td>
                        <td>
                            <asp:Literal ID="litFrequencyDescription" runat="server"></asp:Literal>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;<asp:Literal ID="litFrequencyDescription0" runat="server"></asp:Literal>
                            &nbsp;Repayment Amount:
                        </td>
                        <td style="font-weight: 700">
                            <asp:Label ID="lblRepaymentAmountByFrequency" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                            &nbsp;<asp:Button ID="btnSave" runat="server" Text="Confirm Loan" OnClick="btnSave_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
    <br />
</asp:Content>
