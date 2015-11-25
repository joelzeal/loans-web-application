<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="RunEndOfDay.aspx.cs" Inherits="LoanWebApplication4.admin.RunEndOfDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .errorDiv
        {
            background-color: #FFCCCC;
            border: 1px solid #FF8282;
            padding: 10px;
            color: #370000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        End Of Day Process<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <center>
        <p>
            Use this page to run the end of day process. Calculates penalty for overdue loans
            for all customers.
        </p>
        <asp:Button ID="Button1" runat="server" Text="Run End of Day Process" Height="49px"
            Width="1228px" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Panel ID="errorPanel" CssClass="errorDiv" Visible="false" runat="server">
            You are not authorized to run End of Day Process
        </asp:Panel>
    </center>
    <p>
    </p>
</asp:Content>
