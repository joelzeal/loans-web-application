<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="NewSusuInvestment_MemberPreselected.aspx.cs" ValidateRequest="false" Inherits="LoanWebApplication4.admin.NewSusuInvestment_MemberPreselected" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style28
        {
            width: 95px;
        }
        .style32
        {
            width: 163px;
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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Susu Investment<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <div style="border-bottom:1px solid gray"></div>
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
<%--    <h3 runat="server" id="LoanHeader">
        Investment Details</h3>
    <div class="seperator">
    </div>--%>
    
    <br />
    <asp:Button ID="Button1" runat="server" Text="Create SUSU investment" 
        Width="437px" onclick="Button1_Click1" />
</asp:Content>
