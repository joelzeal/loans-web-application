<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="LoanWebApplication4.AccessDenied_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Access Denied</h1>
<br />
   <div style="padding: 10px; background-color: #FFF4F4; border: 1px solid #CC3300; color: #5E1700">
    <p class ="lic">Access to the requested page has been denied. Please contact administrator</p>
        <br />
    </div>
<%--<div  style ="width :100%">
    <table border="0" cellpadding="0" cellspacing="0" width ="300px" align="center" >
        <tr>
            <td>
            Invalid License
            </td>
        </tr>
    </table>
    </div>--%>
</asp:Content>
