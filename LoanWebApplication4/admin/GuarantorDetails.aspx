<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="GuarantorDetails.aspx.cs" Inherits="LoanWebApplication4.GuarantorDetails" %>




<%@ Register src="../UserControls/DateWebUserControl.ascx" tagname="DateWebUserControl" tagprefix="uc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript">
        function GetRowValue(val) {
            // hardcoded value used to minimize the code.
            // ControlID can instead be passed as query string to the popup window
            window.opener.document.getElementById("ContentPlaceHolder1__TextBox1").value = val;
            window.close();
        }
</script>
    
    
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
            width: 200px;
        }
        .style5
        {
            width: 95px;
        }
        .style6
        {
            height: 26px;
            width: 246px;
        }
        .style7
        {
            width: 246px;
        }
    </style>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Guarantor Details</h1>
    <%-- <asp:HyperLink ID="HyperLink1" runat="server" Style="font-weight: 700">Withdrawal</asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Style="font-weight: 700">Deposit</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" Style="font-weight: 700">Statement</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;--%>
    <asp:HyperLink ID="HyperLink4" runat="server" style="font-weight: 700">Loans Guaranted</asp:HyperLink>
    <br />
    <br />
    <div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr valign="top">
                <td style="width:230px">
                <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Image ID="Image1" Width="200px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" />
                </td>
            </tr>
            <tr>
                <td>
                    <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                    <asp:FileUpload ID="FileUpload1"  runat="server" />
                </td>
               
            </tr>
        </table>
                </td>
                <td>
                <div class="DataSection">
                    <table style="width: 98%;">
                        <tr>
                            <td class="style2" colspan="3">
                                <h4>Personal Details<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </h4></td>
                        </tr>
                        <tr>
                            <td class="style4">
                                First Name:
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="MemberFirstNameTextBox" runat="server" Width="300px" />
                            </td>
                            <td class="style3">
                                <asp:TextBox ID="txtResult" runat="server" Visible="False"></asp:TextBox>
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
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Other Name:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberOtherNameTextBox" runat="server" Width="300px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                DOB:</td>
                            <td class="style7">
                               
                                <%--<uc1:DateWebUserControl ID="DateWebUserControl1" Width="200"  runat="server" />--%>
                               
                                <uc1:DateWebUserControl ID="DateWebUserControl1" runat="server" />
                               
                            </td>
                            <td>
                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="MemberDOBNameTextBox" 
                                    ErrorMessage="Date of birth is required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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
                            <td class="style4">
                                Identification Type:</td>
                            <td class="style7">
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="IDTypeSqlDataSource" DataTextField="Description" 
                                    DataValueField="IdentificationTypeId" Width="300px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="IDTypeSqlDataSource" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                    DeleteCommand="DELETE FROM [IdentificationTypes] WHERE [IdentificationTypeId] = @IdentificationTypeId" 
                                    InsertCommand="INSERT INTO [IdentificationTypes] ([Description]) VALUES (@Description)" 
                                    SelectCommand="SELECT * FROM [IdentificationTypes]" 
                                    UpdateCommand="UPDATE [IdentificationTypes] SET [Description] = @Description WHERE [IdentificationTypeId] = @IdentificationTypeId">
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
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                Identification Number:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberIDNumberTextBox" runat="server" Width="300px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style5">
                                &nbsp;
                            </td>
                            <td class="style7">
                                &nbsp;</td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" colspan="3">
                                <h4>Contact Information</h4></td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Fax:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberFaxTextBox0" runat="server" Width="300px" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                Telephone:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberTelTextBox" runat="server" Width="300px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                           <tr>
                            <td class="style5">
                                Mobile:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberMobileTextBox" runat="server" Width="300px" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                           <tr>
                            <td class="style4">
                                Residential Address:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberResidentialTextBox" runat="server" Width="300px" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                           <tr>
                            <td class="style4">
                                Business Location:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberBusinessLocationTextBox" runat="server" Width="300px" />
                               </td>
                            <td>
                                &nbsp;</td>
                               <%-- </tr>
                           <tr>
                            <td class="style5">
                                Contact Person:</td>
                            <td class="style7">
                                <asp:TextBox ID="MemberContactPersonTextBox" runat="server" Width="200px" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>--%>
                           <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style7">
                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                                &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                           </table></div>
                </td>
            </tr>
        </table>
        
    </div>
    <br />
</asp:Content>
