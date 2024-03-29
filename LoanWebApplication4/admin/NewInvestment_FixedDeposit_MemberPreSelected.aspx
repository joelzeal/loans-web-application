﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="NewInvestment_FixedDeposit_MemberPreSelected.aspx.cs" ValidateRequest="false" Inherits="LoanWebApplication4.admin.NewInvestment_FixedDeposit_MemberPreSelected" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="../UserControls/InvestmentToolBarWebUserControl.ascx" tagname="InvestmentToolBarWebUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/PaymentMethodWebUserControl.ascx" tagname="PaymentMethodWebUserControl" tagprefix="uc2" %>
<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc3" %>
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
        .style28
        {
            width: 95px;
        }
        .style32
        {
            width: 163px;
        }
        .style33
        {
            width: 164px;
        }
        .style34
        {
            width: 494px;
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

//        function callClick() {
//            var saveButton = document.getElementById('<%=Button2.ClientID %>');
//            saveButton.Click();


            parent.jQuery.fancybox.close();
            //__doPostBack('<%=Button2.ClientID %>', "");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                 <h2> New 
        Fixed Deposit Investment</h2>&nbsp;</td>
            <td align="right">
               
                <uc1:InvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl1" 
                    runat="server" />
               
            </td>
        </tr>
    </table>

    
       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
  
  
    <h3 runat="server" id="memberHeader">
        Member Details</h3>
        <div class="seperator"></div>
    <div class="DataSection" visible="false" id="dataSection" runat="server">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 170px">
                    <asp:Image ID="Image1" Width="135px"  runat="server" 
                        CssClass="memberImageBox2" />
                    
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
                                    <td class="style32">
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
                                    <td class="style32">
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
                                    <td class="style32">
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
                                    <td class="style32">
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
    <h3 runat="server" id="LoanHeader">
        Investment Details</h3>
    <div class="seperator">
    </div>
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
                <uc2:PaymentMethodWebUserControl ID="PaymentMethodWebUserControl1" 
                    runat="server" />
                <table style="width: 100%;">
                    <tr>
                        <td class="style33">
                            Investment Amount:
                        </td>
                        <td class="style34">
                            <asp:TextBox ID="PrincipalTextBox" runat="server" Style="text-align: right" Width="300px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PrincipalTextBox"
                                ErrorMessage="*" ForeColor="Red" ToolTip="Principal is required"></asp:RequiredFieldValidator>
                            &nbsp;<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="PrincipalTextBox" ErrorMessage="Invalid Number" ForeColor="Red"
                                ValidationExpression="\d+\.?\d*"></asp:RegularExpressionValidator>--%>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            Interest Type:
                        </td>
                        <td class="style34">
                            <asp:DropDownList ID="InterestTypeDropDownList" runat="server" Width="300px">
                                <asp:ListItem Value="50">----None----</asp:ListItem>
                                <asp:ListItem Value="1">Compound Interest</asp:ListItem>
                                <asp:ListItem Value="2">Simple Interest</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" valign="top">
                            Interest Duration:
                        </td>
                        <td class="style34" valign="top">
                            <asp:DropDownList ID="cboInterestDuration" runat="server" AutoPostBack="True" DataSourceID="InterestPresetsSqlDataSource"
                                DataTextField="Description" DataValueField="LoanPresetId" OnSelectedIndexChanged="cboInterestDuration_SelectedIndexChanged"
                                Width="300px" OnDataBound="cboInterestDuration_DataBound">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="InterestPresetsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT * FROM [LoanPresets]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" valign="top">
                            Interest Rate:
                        </td>
                        <td class="style34" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="InterestTextBox" runat="server" Style="text-align: right" Width="300px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="InterestTextBox"
                                        ErrorMessage="*" ForeColor="Red" ToolTip="Interest Rate is required"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="InterestTextBox"
                                        ErrorMessage="Invalid Number" ForeColor="Red" ValidationExpression="/^\d+\.?\d*$/"></asp:RegularExpressionValidator>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="cboInterestDuration" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                            Duration Type:
                        </td>
                        <td class="style34">
                            <asp:DropDownList ID="cboLoanDurationType" runat="server" DataSourceID="LoanDurationsSqlDataSource"
                                DataTextField="Description" DataValueField="LoanDurationId" OnDataBound="cboLoanDurationType_DataBound"
                                Width="300px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="LoanDurationsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                SelectCommand="SELECT * FROM [LoanDurations] ORDER BY [Description]"></asp:SqlDataSource>
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
                        <td class="style33" valign="top">
                            Duration:
                        </td>
                        <td class="style34" valign="top">
                            <asp:TextBox ID="DurationTextBox" runat="server" Style="text-align: right" Text='<%# Bind("Duration") %>'
                                Width="300px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DurationTextBox"
                                ErrorMessage="*" ForeColor="Red" ToolTip="Duration is required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33" valign="top">
                            Investment Date:</td>
                        <td class="style34" valign="top">
                            <uc3:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style34">
                            <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
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
                            &nbsp;Investment Amount:&nbsp;
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
                            &nbsp;Maturity Amount:
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
                            &nbsp;Interest Rate:
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
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                            &nbsp;<asp:Button ID="btnSave" runat="server" Text="Confirm Investment" OnClick="btnSave_Click" />
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
