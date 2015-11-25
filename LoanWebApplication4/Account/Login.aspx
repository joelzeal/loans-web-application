<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoanWebApplication4.Account.Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            position: relative;
            top: 20px;
            left: 20px;
        }
        .style2 b
        {
            margin-top: 10px;
            color: #4b6c9e;
        }
        
        
        .hrCustom
        {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            margin-right: 30px;
            margin-top: 10px;
            margin-bottom: 10px;
            background-color: #718EBB;
            height: 1px;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
       
    <asp:Panel runat="server"  Visible="false" CssClass="errorPage" ID="ErrorPanel"> 
        <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server"
                                ValidationGroup="LoginUserValidationGroup" 
            DisplayMode="List" />
        <asp:Label ID="FailureText" runat="server"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </asp:Panel>
  <%--  <asp:RoundedCornersExtender ID="Panel2_RoundedCornersExtender" runat="server" BorderColor="Red"
        Enabled="True" TargetControlID="ErrorPanel">
    </asp:RoundedCornersExtender>--%>
    
    <div style="margin: 100px auto; width: 500px">
        <h2>
          User Log In
        </h2>
        <p>
            Please enter your username and password.
            </p>
        <asp:Panel runat="server" ID="Panel1" BackColor="#DDEEFF" BorderColor="#9FCFFF" BorderWidth="1px">
            <asp:Login ID="LoginUser" CssClass="myLoginClass" BorderColor="Transparent" runat="server"
                EnableViewState="false" RenderOuterTable="true" 
                OnLoggedIn="LoginUser_LoggedIn" onloginerror="LoginUser_LoginError">
                <LayoutTemplate>
                   
                        <div class="style2">
                            <%--<img alt="login" src="~/Images/loginIcon.png" style="float: left; margin-right: 10px" />--%>
                            <b>Log In</b>
                            
                        </div>
                    
                    <div class="accountInfo">
                        <%-- <fieldset class="login">
                    <legend>Account Information</legend>--%>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="UserName" CssClass="textEntry" Skin="Web20"
                                      Height="30px"  Width="320px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="passwordEntry"
                                      Height="30px"     Skin="Web20" Width="320px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
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
                                <td>
                                    <asp:CheckBox ID="RememberMe" runat="server" />
                                    <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server">Forgotten Password</asp:LinkButton>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <p>
                            <%--  </fieldset>--%>
                            
                            <p>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In"
                                    ValidationGroup="LoginUserValidationGroup" Skin="Web20" Height="28px" 
                                    Width="100px" />
                            </p>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </asp:Panel>
        <%--<asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" BorderColor="#728FBC"
            Corners="All" Enabled="True" TargetControlID="Panel1">
        </asp:RoundedCornersExtender>--%>
    </div>
</asp:Content>
