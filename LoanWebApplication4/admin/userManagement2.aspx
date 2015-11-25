<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="userManagement2.aspx.cs" Inherits="LoanWebApplication4.admin.userManagement2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div >
        <h2>
            User Management
        </h2>
        <br />
        <div>
        </div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Width="333px">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width: 100%; height: 100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User"
                                        ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table style="font-size:100%;width:333px;">
                            <tr>
                                <td align="center">
                                    Complete</td>
                            </tr>
                            <tr>
                                <td>
                                    Your account has been successfully created.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                        CommandName="Continue" onclick="ContinueButton_Click" Text="Continue" 
                                        ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                    Text="Previous" />
                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
            </FinishNavigationTemplate>
            <StartNavigationTemplate>
                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                    Text="Next" />
            </StartNavigationTemplate>
            <StepNavigationTemplate>
                <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                    Text="Previous" />
                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
            </StepNavigationTemplate>
        </asp:CreateUserWizard>
        <br />
        <br />
        <div class="dataEntryContainer">
            <h3>
                User Management
                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
            </h3>
            <hr />
            <div>
            </div>
            <script language="javascript" type="text/javascript">
                //--- For Checkbox in Gridview
                function SelectAll(id) {
                    var frm = document.forms[0];

                    for (i = 0; i < frm.elements.length; i++) {
                        if (frm.elements[i].type == "checkbox") {
                            frm.elements[i].checked = document.getElementById(id).checked;
                        }
                    }
                }
            </script>
            <p>
            </p>
            In order to display all users whose name begins with letter click on the link letter:
            <p>
            </p>
            <asp:Repeater ID="rptAlphabetBar" runat="server" OnItemCommand="rptAlphabetBar_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Container.DataItem %>'
                        Text='<%# Container.DataItem %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
            <p>
            </p>
            Use the below feature to search users by partial username or e-mail:
            <p>
            </p>
            <asp:DropDownList ID="ddlUserSearchTypes" runat="server" Style="position: static">
                <asp:ListItem Selected="true" Text="UserName"></asp:ListItem>
                <asp:ListItem Text="E-mail"></asp:ListItem>
            </asp:DropDownList>
            contains
            <asp:TextBox ID="txtSearchText" runat="server" Style="position: static"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server"  OnClick="btnSearch_Click"
                Text="Search" />
            <br />
            <br />
            <br />
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="UserName" ForeColor="#333333" GridLines="None" OnDataBound="gvUsers_DataBound"
                OnRowDataBound="gvUsers_RowDataBound" Style="position: static">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbxAll" runat="server" Style="position: static" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxId" runat="server" Style="position: static" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Email" HeaderText="Email" DataFormatString="<a href=mailto:{0}>{0}</a>"
                        HtmlEncode="False" />
                    <asp:TemplateField HeaderText="Created">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreationDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreationDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="IsApproved" HeaderText="Is Approved" />
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <EmptyDataTemplate>
                    No users found.
                </EmptyDataTemplate>
                <EditRowStyle BackColor="#2461BF" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btn_Delete" runat="server" CssClass="SubmitBtn" Font-Bold="True"
                OnClick="btn_Delete_Click" Text="Delete Selected"  /><br />
            <br />
            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="#FF0000" Style="position: static"
                Width="211px"></asp:Label>
                </div>
                </div>
</asp:Content>
