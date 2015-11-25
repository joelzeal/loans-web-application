<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="MemberDetails.aspx.cs" Inherits="LoanWebApplication4.MemberDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 26px;
        }
        .style4
        {
            height: 26px;
        }
        .style5
        {
            width: 229px;
        }
        .style6
        {
            height: 26px;
            width: 246px;
        }
        .style7
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Member Details</h1>
    <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
    <div class="links">
        <asp:HyperLink ID="HyperLink2" runat="server" Style="font-weight: 700">Investment</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;
        <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink4" runat="server" Style="font-weight: 700">Loan</asp:HyperLink></div>
    <div class="seperator">
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  
    <div>
        <asp:ValidationSummary CssClass="errorDiv" ID="ValidationSummary1" runat="server" />
        <div class="seperator">
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr valign="top">
                <td style="width: 230px">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Image ID="Image1" Width="200px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" />
                                <center>
                                    Member Photo
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="220px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Image ID="Image2" Width="200px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" /><br />
                                <center>
                                    Member Signature
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                                <asp:FileUpload ID="FileUpload2" runat="server" Width="220px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Image ID="Image3" Width="200px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" /><br />
                                <center>
                                    Member Identification
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                                <asp:FileUpload ID="FileUpload3" runat="server" Width="220px" />
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
                                <td class="style4">
                                    First Name:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Width="300px" />
                                </td>
                                <td class="style3">
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Last Name:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberLastNameTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MemberLastNameTextBox"
                                        ErrorMessage="Last name is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Other Name:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberOtherNameTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Gender:
                                </td>
                                <td class="style7">
                                    <asp:DropDownList Width="300px" ID="cboGender" runat="server">
                                        <asp:ListItem Value="----Select----">----Select----</asp:ListItem>
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="cboGender"
                                        ErrorMessage="Gender is required" Operator="NotEqual" SetFocusOnError="True"
                                        Style="color: red" ValueToCompare="----Select----"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    DOB:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberDOBNameTextBox" runat="server" Width="300px" />
                                    <asp:CalendarExtender ID="MemberDOBNameTextBox_CalendarExtender" runat="server" Format="dd-MMM-yyyy"
                                        Enabled="True" TargetControlID="MemberDOBNameTextBox">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MemberDOBNameTextBox"
                                        ErrorMessage="Date of birth is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Branch:
                                </td>
                                <td class="style7">
                                    <asp:DropDownList ID="cboBranches" runat="server" 
                                        DataSourceID="BranchesSqlDataSource1" DataTextField="BranchName" 
                                        DataValueField="BranchID" Width="300px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="BranchesSqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Branches] ORDER BY [BranchName]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Account Type:
                                </td>
                                <td class="style7">
                                    <asp:DropDownList ID="cboAccountType" Width="300px" runat="server" DataSourceID="AccountTypesSqlDataSource"
                                        DataTextField="Description" DataValueField="AccountTypeId">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="AccountTypesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                                        SelectCommand="SELECT [AccountTypeId], [Description] FROM [AccountTypes] ORDER BY [Description]">
                                    </asp:SqlDataSource>
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
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="AccountTextBox" runat="server" Width="300px" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="CheckBox1" EventName="CheckedChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    &nbsp;
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Auto generate account number" AutoPostBack="True"
                                        OnCheckedChanged="CheckBox1_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Identification Type:
                                </td>
                                <td class="style7">
                                    <asp:DropDownList Width="300px" ID="DropDownList1" runat="server" DataSourceID="IDTypeSqlDataSource"
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
                                <td class="style4">
                                    Identification Number:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberIDNumberTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="MemberIDNumberTextBox"
                                        ErrorMessage="Identification number is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;
                                </td>
                                <td class="style7">
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
                                <td class="style5">
                                    Fax:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberFaxTextBox0" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Telephone:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberTelTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Mobile:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberMobileTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Residential Address:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberResidentialTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    Business Location:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberBusinessLocationTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;
                                </td>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="3">
                                    <h4>
                                        Contact Person</h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Contact Person:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberContactPersonTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Telehone:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="MemberContactNumberTextBox" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;
                                </td>
                                <td class="style7">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="3">
                                    <h4>
                                        Next of Kin</h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Name:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="txtNextOfKin" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    Telehone:
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="txtNextOfKinTelephone" runat="server" Width="300px" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;
                                </td>
                                <td class="style7" colspan="2">
                                    <asp:Button ID="Button1" runat="server" Text="Save and Exit" OnClick="Button1_Click" />
                                    &nbsp;<asp:Button ID="Button3" runat="server" Text="Save" OnClick="Button3_Click" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br />
</asp:Content>
